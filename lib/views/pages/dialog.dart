import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

Future<void> dialog(context, String? message, Map<String, dynamic> data) async {
  message ??= "(empty message)";
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("アラート通知"),
        content: Text(message!),
        actions: <Widget>[
          // ボタン領域
          // TextButton(
          //   onPressed: () => Routemaster.of(context).pop(),
          //   child: const Text("異常"),
          // ),
          TextButton(
            onPressed:()=> Routemaster.of(context).pop(),
            child: const Text("確認"),
          ),
        ],
      );
    },
  );
}
