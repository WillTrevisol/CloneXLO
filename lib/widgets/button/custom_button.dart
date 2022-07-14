import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.widget, required this.backColor, required this.onPressed, Key? key}) : super(key: key);

  final Widget widget;
  final Color backColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 20, bottom: 12),
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
            color: Colors.white,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backColor),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), 
            ),
          ),
        ),
        onPressed: onPressed,
        child: widget,
      ),
    );
  }
}