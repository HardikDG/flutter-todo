import 'package:flutter/material.dart';

enum ConfirmAction { CANCEL, ACCEPT }
Future<ConfirmAction> asyncConfirmation(
    {BuildContext context,
    String tite,
    String content,
    String successText,
    String cancelText = 'Cancel'}) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(tite),
        content:  Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text(cancelText),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: Text(successText),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}
