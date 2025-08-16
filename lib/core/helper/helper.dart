import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';

sealed class Helper {
  Helper._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static void showToast(
      {required String message, required bool themeController}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor:
          // ignore: deprecated_member_use
          themeController ? Colors.black : AppColors.textGray.withOpacity(0.8),
      textColor: themeController ? Colors.white : Colors.black,
      fontSize: 16.0,
    );
  }

  static String formatWithComma(String input) {
    final buffer = StringBuffer();
    int counter = 0;

    for (int i = input.length - 1; i >= 0; i--) {
      buffer.write(input[i]);
      counter++;

      if (counter % 3 == 0 && i != 0) {
        buffer.write(',');
      }
    }

    return buffer.toString().split('').reversed.join('');
  }

  String doubleToSum(double num, {bool showPrefix = true}) {
    try {
      final String subSum = num.toStringAsFixed(2).split(".").last;
      final double currentSum = num - double.parse("0.$subSum");
      return "${(currentSum.toInt()).toString().replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ')}${showPrefix ? ".$subSum" : ""}";
    } catch (e) {
      return "Infinite";
    }
  }

  static double customButtonPadding =
      MediaQuery.of(navigatorKey.currentState!.context).padding.bottom;
}