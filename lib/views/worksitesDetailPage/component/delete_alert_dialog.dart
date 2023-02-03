import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('確認'),
      content: const Text('本当にこの現場情報を削除しますか？'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('はい'),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
        GestureDetector(
          child: const Text('いいえ'),
          onTap: () {
            Navigator.pop(context, false);
          },
        )
      ],
    );
  }
}