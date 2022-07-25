import 'package:intl/intl.dart';

extension StringExtension on String {

  bool isEmailValid() {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    );

    return regex.hasMatch(this);
  }

  String formatedPostalCode() {
    String postalCode = trim().replaceAll('.', '').replaceAll('-', '');

    if (length != 8) {
      postalCode = ('${postalCode}000').substring(0, 8);
    } else {
      postalCode = this;
    }

    return '${postalCode.substring(0, 2)}.${postalCode.substring(2, 5)}-${postalCode.substring(5, 8)}';
  }

}

extension NumberExtension on num {

  String formatedMoney() {
   return NumberFormat('R\$ ###,##0.00', 'pt-BR').format(this); 
  }

}

extension DateTimeExtension on DateTime {

  String formatedDate() {
    return DateFormat('dd/MM/yyyy HH:mm', 'pt-BR').format(this);
  }
}