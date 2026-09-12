import 'package:flutter/services.dart';

class PostalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Format postal code (5 digits)
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limitedDigits = digits.length > 5 ? digits.substring(0, 5) : digits;

    return TextEditingValue(
      text: limitedDigits,
      selection: TextSelection.collapsed(offset: limitedDigits.length),
    );
  }
}
