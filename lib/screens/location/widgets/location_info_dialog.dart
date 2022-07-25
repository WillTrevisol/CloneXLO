import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = Center(
      child: Text(
        'Localização automática',
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
    );

    const content = Text(
      'Permita acesso à localização para ficar' 
        'mais fácil encontrar anúncios na sua região'
    );
    const okText = Text('OK');
    okCallBack() => Navigator.of(context).pop();

    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: <Widget> [
          CupertinoDialogAction(
            onPressed: okCallBack,
            child: okText,
          ),
        ],
      );
    }

    return AlertDialog(
      title: title,
      content: content,
      actions: <Widget> [
        TextButton(
          onPressed: okCallBack, 
          child: okText
        )
      ],
    );
  }
}