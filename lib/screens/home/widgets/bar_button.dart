import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({required this.decoration, required this.label, required this.onTap, Key? key}) : super(key: key);

  final BoxDecoration decoration;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}