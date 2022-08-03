package com.example.dyte_challenge_example;


import androidx.annotation.NonNull;

import java.util.Timer;
import java.util.TimerTask;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
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
                final System exe = null;
                exe.toString();
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
