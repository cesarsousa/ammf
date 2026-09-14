# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

AMMF is the institutional website + admin backend for a therapy/training organization (courses, "constelações", books, therapists, participants, blog, FAQ, testimonials, etc.). It's a legacy Java web app (VRaptor 3 MVC, Hibernate 3 ORM, JSP views, deployed as a WAR to Tomcat) currently being migrated from an Eclipse-managed WTP project to a Maven build (see branch `migracao-maven`).

## Build & run

Maven build only exists to produce `ammf.war`; there is no test suite, linter, or CI configured.

```bash
mvn clean package
```

- Java source/target level is 1.6 (`pom.xml` `maven.compiler.source/target`) — do not use post-Java 6 language features.
- Output artifact: `target/ammf.war` (`finalName` = `ammf`).
- Deployment target is Tomcat 6 (per `README.txt`); there's no embedded server/plugin configured, so run/debug by deploying the WAR to a local Tomcat 6 instance registered in Eclipse, or via `mvn tomcat...` if a plugin is added later.
- `pom.xml` has inline `ATENCAO`/`REVIEW` comments flagging non-obvious coordinates for this legacy dependency set (e.g. `mirror` is groupId `net.vidageek` not `br.com.caelum`; Hibernate 3.x artifact is `hibernate` not `hibernate-core`; `javassist` groupId is `org.javassist` with a hyphen before `GA`). Keep those comments if you touch dependency versions — they document mismatches between the old lib/ jars and Maven Central coordinates.
- The `.classpath`, `.project`, `.settings/` files are Eclipse/m2e project metadata for the WTP→Maven migration; keep them in sync with `pom.xml` if you change dependencies, but they are not build inputs for `mvn package`.

## Database

- Hibernate 3 (annotation-based entities) configured via [hibernate.cfg.xml](src/main/resources/hibernate.cfg.xml) — MySQL, C3P0 connection pool, `hibernate.hbm2ddl.auto=update` (schema auto-updates on startup, no migration scripts).
- **The committed config points at production** (`quironps_ammf` on the deploy host). Commented-out blocks above it show the local (`ammf` on localhost) and old-production connection strings — swap the active `<property>` block when working locally, and never commit a change that points production credentials somewhere else without confirming with the user first.
- Every entity class used by Hibernate must be registered in the `<mapping class="...">` list in `hibernate.cfg.xml`, or it won't be persisted.
- [HibernateUtil.java](src/main/java/br/com/ammf/utils/HibernateUtil.java) builds the singleton `SessionFactory` at class-load time from that config; VRaptor's `HibernateCustomProvider` (configured in `web.xml`) hands each request a `Session` for injection.

## Architecture

Classic VRaptor 3 layering: `controller` → `service` → `repository` → Hibernate `Session`, with `model` as the JPA/Hibernate entities and constructor-injection wiring everything (VRaptor's IoC, not Spring, even though Spring jars are on the classpath — Spring is currently unused for DI; check before assuming its context is bootstrapped).

- **`controller/`** — one `@Resource` class per feature area (`PessoaController`, `ConstelacaoController`, `LojaController`, ...). Methods are mapped with `@Get("/path")` / `@Post("/path")`; `@Restrito` (see `interceptor/Restrito.java`) marks admin-only actions. Dependencies (repositories, services, `Result`) are injected via the constructor — there are no setters or field injection.
- **`interceptor/AutorizacaoInterceptor.java`** — intercepts any resource method annotated `@Restrito`; if `SessaoUsuario` (session-scoped, see below) isn't logged in, it redirects to `LoginController.login()` instead of invoking the method. Add `@Restrito` to any new admin-only endpoint rather than checking login state manually.
- **`service` / `service/imp`** — business-logic interfaces and their `*Imp` implementations (e.g. `PessoaService` / `PessoaServiceImp`). Controllers depend on the interface.
- **`repository` / `repository/imp`** — data-access interfaces (`PessoaRepository`) and Hibernate `Criteria`/HQL implementations (`PessoaDao`, annotated `@Component` so VRaptor's container can inject them by interface). **Naming isn't fully consistent**: most `*Repository` interfaces live directly under `repository/`, but `ParticipanteRepository` lives under `repository/imp/` alongside its implementation `ParticipanteDao` — check the actual package when wiring a new consumer instead of assuming the `repository/` root.
- Every repository method wraps its body in `try { ... } catch (Exception e) { throw new ErroAplicacao(new Excecao(...)); }`, capturing the class + calling-method name via `Thread.currentThread().getStackTrace()`. Follow this pattern for new DAO methods so errors surface through the same logging path (`exception/ErroAplicacao.java`, `exception/GeraLog.java`).
- **`model/`** — Hibernate-annotated entities. `Situacao` / `Status` enums drive soft-delete and workflow state (e.g. `Pessoa` registrations move through `PENDENTE` → `CONFIRMADO`, and removal sets `Situacao` + `dataExclusao` rather than deleting the row — see `PessoaDao.remover`).
- **Session-scoped state**: `SessaoUsuario` (admin/staff login) and `SessaoCliente` are `@Component @SessionScoped` model classes injected directly into controllers/interceptors as the source of truth for "is someone logged in" — there's no separate auth/session service.
- **Email**: `service/EmailService` + `imp/EmailServiceImp` build messages from HTML templates in [src/main/resources/html_mensagem/](src/main/resources/html_mensagem/) (one file per notification type — cadastro, comentário, contato, depoimento, faq, link, livro, resenha, etc.) and send via `utils/email/Email.java` (JavaMail). When adding a new notification, add the template there and a corresponding `EmailService` method rather than building HTML inline in a controller.
- **Views**: JSPs under `src/main/webapp/WEB-INF/jsp/<feature>/`, one directory per controller's feature area, matching the controller/service naming. `web.xml` includes `/WEB-INF/jsp/prelude.jsp` on every JSP request.
- **Errors**: uncaught exceptions surface via `exception/ErroAplicacao` + `Excecao`, logged through `exception/GeraLog.java` and persisted via `LogAplicacaoRepository`/`LogAplicacaoDao` (`model/LogAplicacao`) — check that table/log when debugging a reported "erro inesperado" rather than only grepping logs.
