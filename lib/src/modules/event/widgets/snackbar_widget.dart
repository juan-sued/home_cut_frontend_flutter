import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    String actionLabel = 'Fechar',
    void Function()? onPressed,
    String type = 'info',
  }) {
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case 'info':
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        break;
      case 'error':
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
      case 'success':
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case 'warning':
        backgroundColor = Colors.yellow;
        textColor = Colors.black;
        break;
      default:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        action: SnackBarAction(
          label: actionLabel,
          textColor: textColor,
          onPressed: onPressed ??
              () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
