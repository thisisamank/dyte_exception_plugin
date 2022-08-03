package com.example.dyte_challenge.handlers;

import androidx.annotation.NonNull;

import com.example.dyte_challenge.exception.DyteException;

public class DyteExceptionHandler implements Thread.UncaughtExceptionHandler {
    final private Reporter reporter;

    public DyteExceptionHandler(Reporter reporter) {
        this.reporter = reporter;
    }

    @Override
    public void uncaughtException(@NonNull Thread thread, @NonNull Throwable throwable) {
        DyteException exception = new DyteException();
        exception.setMessageFromException(throwable);
        reporter.report(exception.toString());
    }
}
