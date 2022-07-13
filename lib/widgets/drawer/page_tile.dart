import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile({
    Key? key, 
    required this.label, 
    required this.icon, 
    required this.onTap, 
    required this.selected}) 
    : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? Colors.purple : Colors.black,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: selected ? Colors.purple : Colors.black, 
        ),
      ),
      onTap: onTap,
    );
  }
}