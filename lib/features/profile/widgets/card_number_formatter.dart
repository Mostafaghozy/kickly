import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove anything that isn't a number
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Maximum 16 digits
    final limitedDigits = digits.length > 16 ? digits.substring(0, 16) : digits;

    // Add space after every 4 digits
    final buffer = StringBuffer();

    for (int i = 0; i < limitedDigits.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }

      buffer.write(limitedDigits[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
