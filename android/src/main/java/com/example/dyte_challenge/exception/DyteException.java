package com.example.dyte_challenge.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

public class DyteException {
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessageFromException(Throwable exception) {
        StringWriter stackTrace = new StringWriter();
        exception.printStackTrace(new PrintWriter(stackTrace));
        StringBuilder errorReport = new StringBuilder();
        errorReport.append(stackTrace);
        this.message = errorReport.toString();
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return message;
    }
}
