<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center">

<table id="tabMenuPrincipal" >
	<tr>
		<td>
			<ul id="menu">
				<li>
					
				</li>
				<li>
					<img id="imagemPsicologia" class="imgMenuPrincipal opacidade" src="${imagem}/iconePsicologia.png"/>
					<a id="linkPsicologia" href="<c:url value="/index/psicologia"/>">Psicologia</a></li>
				<li>
					<img id="imagemEducacao" class="imgMenuPrincipal opacidade" src="${imagem}/iconeEducacao.png"/>
					<a id="linkEducacao" href="<c:url value="/index/educacao"/>">Educa&ccedil;&atilde;o</a></li>
				<li>
					<img id="imagemCultura" class="imgMenuPrincipal" src="${imagem}/iconeCultura.png"/>
					<a id="linkCultura" href="<c:url value="/index/cultura"/>">Cultura</a></li>
				<li>
					<img id="imagemOrientais" class="imgMenuPrincipal" src="${imagem}/iconeOriental.png"/>
					<a id="linkOrientais" href="<c:url value="/index/artesorientais"/>">Artes Orientais</a></li>
			</ul>
		</td>
	</tr>
</table>

<div class="separador"></div> 


<div align="center">
	<div id="menuLink">
		
			<ul id="menuRodape">
				<li>
				<form action="<c:url value="/" />">
				<input type="submit" value="Home" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Blog" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Resenhas" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Consultas" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Calendario" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Links" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/cliente/depoimentos" />" method="get">
				<input type="submit" value="Depoimentos" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Cursos" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/cliente/cadastro" />" method="get">
				<input type="submit" value="Cadastro" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Contato" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Loja Virtual" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="FAQ" class="buttonFooter">
				</form>
				</li>
			</ul>		
				
	</div>
</div>

</div>
