import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({super.key});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: selectedCountry,
        hint: Text(
          "Choose your country",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),

        items: const [
          DropdownMenuItem(
            value: "Egypt",
            child: CustomText(text: "Egypt"),
          ),
          DropdownMenuItem(
            value: "Saudi Arabia",
            child: CustomText(text: "Saudi Arabia"),
          ),
          DropdownMenuItem(
            value: "United Arab Emirates",
            child: CustomText(text: "United Arab Emirates"),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 38,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.fromBorderSide(
              BorderSide(color: Colors.grey.shade400, width: 0.5),
            ),
          ),
        ),

        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey.shade600,
          ),
        ),

        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          elevation: 1,

          offset: Offset(0, 0),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
