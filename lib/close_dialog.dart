import 'package:flutter/material.dart';

Future<String?> showCloseDialog(BuildContext context) async {
  String inputText = '';
  
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Введите текст'),
        content: TextField(
          onChanged: (text) => inputText = text,
          // decoration: InputDecoration(hintText: 'Введите что-нибудь'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, inputText),
            child: Text('Accept'),
          ),
        ],
      );
    },
  );
}
