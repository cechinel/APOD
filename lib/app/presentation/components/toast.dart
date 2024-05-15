import 'package:flutter/material.dart';

class Toast {
  static void show(
    BuildContext context, {
    Duration duration = const Duration(seconds: 3),
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor ?? Colors.grey,
        duration: duration,
        margin: const EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static error(
    BuildContext context, {
    Duration duration = const Duration(seconds: 3),
    required String message,
  }) {
    return Toast.show(
      context,
      duration: duration,
      message: message,
      backgroundColor: Colors.red,
    );
  }

  static success(
    BuildContext context, {
    Duration duration = const Duration(seconds: 3),
    required String message,
  }) {
    return Toast.show(
      context,
      duration: duration,
      message: message,
      backgroundColor: Colors.green,
    );
  }
}
