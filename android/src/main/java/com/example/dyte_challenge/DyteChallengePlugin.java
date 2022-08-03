package com.example.dyte_challenge;

import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;

import com.example.dyte_challenge.constants.Constants;
import com.example.dyte_challenge.handlers.DyteExceptionHandler;
import com.example.dyte_challenge.handlers.Reporter;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** DyteChallengePlugin */
public class DyteChallengePlugin implements FlutterPlugin {

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
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger()
            , Constants.METHOD_CHANNEL_NAME);
    final Reporter exceptionReporter = new ExceptionReporter();
    final Thread.UncaughtExceptionHandler dyteExceptionHandler =
            new DyteExceptionHandler(exceptionReporter);
    Thread.setDefaultUncaughtExceptionHandler(dyteExceptionHandler);
  }


  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
