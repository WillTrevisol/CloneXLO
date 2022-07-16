import 'dart:io';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({required this.image, required this.onDelete, Key? key}) : super(key: key);

  final String image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Image.file(
            File(image),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.grey[200]),
            ),
            child: const Text(
              'Excluir',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}