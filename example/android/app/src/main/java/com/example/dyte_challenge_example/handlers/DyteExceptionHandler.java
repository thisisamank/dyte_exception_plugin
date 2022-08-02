package com.example.dyte_challenge_example.handlers;

import androidx.annotation.NonNull;

import com.example.dyte_challenge_example.exception.DyteException;

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
