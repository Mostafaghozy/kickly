import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';

class CustomFormFiled extends StatefulWidget {
  const CustomFormFiled({
    super.key,
    required this.hintText,
    required this.isPassword,
  });

  final String hintText;
  final bool isPassword;

  @override
  State<CustomFormFiled> createState() => _CustomFormFiledState();
}

class _CustomFormFiledState extends State<CustomFormFiled> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextFormField(
        cursorHeight: 18,
        cursorWidth: 1,
        cursorColor: Colors.black,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: "Mulish",
        ),
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFB5B9C5),
            fontFamily: "Mulish",
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
          ),
          suffixIconColor: AppColors.primary,

          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: _toggleObscure,
                  icon: Icon(
                    size: 20,
                    _isObscure
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_solid,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
