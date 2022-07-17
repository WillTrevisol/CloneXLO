import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.widget, required this.borderRadius, required this.backColor, required this.onPressed, Key? key}) : super(key: key);

  final Widget widget;
  final Color backColor;
  final double borderRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
            color: Colors.white,
            fontSize: 18,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all(backColor),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius), 
            ),
          ),
        ),
        onPressed: onPressed,
        child: widget,
      ),
    );
  }
}