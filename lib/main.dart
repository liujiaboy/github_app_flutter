import 'dart:async';
import 'package:flutter/material.dart';
import 'package:github_app_flutter/app.dart';
import 'package:github_app_flutter/pages/error/error_page.dart';

void main() {
  // 错误处理
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return ErrorPage(errorMsg: details.exception.toString(), errorDetails: details);
    };
    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
    debugPrint(stack.toString());
  });
}
