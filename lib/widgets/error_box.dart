import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({required this.message, required this.radius, Key? key}) : super(key: key);

  final String? message;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.red.withAlpha(200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
          ),
          Expanded(
            child: Text(
              'Opa, $message',
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