import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({required this.labelText, required this.onChanged, required this.initialValue, Key? key}) : super(key: key);

  final String labelText;
  final Function(int?) onChanged;
  final int? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          border: const OutlineInputBorder(),
          isDense: true,
          labelText: labelText,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(),
        ],
        keyboardType: TextInputType.number,
        onChanged: (text) {
            onChanged(int.tryParse(text.replaceAll('.', '')));
        },
        initialValue: initialValue?.toString()
      ),
    );
  }
}