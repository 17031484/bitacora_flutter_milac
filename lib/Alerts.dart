import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:test_app/home.page.dart';

class Alerts {
  static showConfirmAlert(context, color,titulo, message, confirmText) {
    QuickAlert.show(
      title: titulo,
      context: context,
      type: QuickAlertType.info,
      text: message,
      confirmBtnText: confirmText,
      confirmBtnColor: color,
    );
  }

  static Future<void> showSuccessAlert(titulo,context, message, QuickAlertType type) async {
      QuickAlert.show(
        barrierDismissible: false, 
        title: titulo,
        context: context,
        type: type,
        text: message,
        onConfirmBtnTap: () async{
          Navigator.of(context, rootNavigator: true).pop('dialog');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
  }

  
}
