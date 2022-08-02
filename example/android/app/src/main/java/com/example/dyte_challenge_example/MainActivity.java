package com.example.dyte_challenge_example;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.dyte_challenge_example.constants.Constants;
import com.example.dyte_challenge_example.handlers.Reporter;
import com.example.dyte_challenge_example.handlers.DyteExceptionHandler;

import java.io.FileReader;
import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private MethodChannel methodChannel;

    // ExceptionReporter is used to invoke MethodChannel with correct data.
    class ExceptionReporter implements Reporter {
        @Override
        public void report(String data) {
            new Handler(Looper.getMainLooper())
                    .postDelayed(() -> methodChannel.invokeMethod(Constants.EXCEPTION_SEND_METHOD_NAME, data), 0);
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger()
                , Constants.METHOD_CHANNEL_NAME);
        final Reporter exceptionReporter = new ExceptionReporter();
        final Thread.UncaughtExceptionHandler dyteExceptionHandler =
                new DyteExceptionHandler(exceptionReporter);
        Thread.setDefaultUncaughtExceptionHandler(dyteExceptionHandler);
        startThrowingExceptions();
    }

    private void startThrowingExceptions() {

        // Testing DivisionByZero exception
        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                int main = 500 / 0;
            }
        }, 10000);

        // Testing NullPointerException
        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                final Reporter exe = null;
                exe.report("something");
            }
        }, 20000);

        // Testing RuntimeException
        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                throw new RuntimeException();
            }
        }, 25000);
    }

}
