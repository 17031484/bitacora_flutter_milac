import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:test_app/home.page.dart';

class Alerts {
  static showConfirmAlert(context, color, message, confirmText) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: message,
      confirmBtnText: confirmText,
      confirmBtnColor: color,
    );
  }

  static Future<void> showSuccessAlert(context, message) async {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: message,
        onConfirmBtnTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
  }
}
