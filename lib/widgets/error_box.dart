import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({required this.message, Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red.withAlpha(200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          Expanded(
            child: Text(
              'Opa, $message\nTente novamente!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}