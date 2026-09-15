package br.com.ammf.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.caelum.vraptor.observer.upload.UploadedFile;

@Convert(UploadedFile.class)
public class UploadedFileConverter implements Converter<UploadedFile> {

    private final HttpServletRequest request;

    @Inject
    public UploadedFileConverter(HttpServletRequest request) {
        this.request = request;
    }

    public UploadedFile convert(String value, Class<? extends UploadedFile> type) {
        Object upload = request.getAttribute(value);
        return upload == null ? null : type.cast(upload);
    }

}
