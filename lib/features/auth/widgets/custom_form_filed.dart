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
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: "Mulish-Bold.ttf",
        ),
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "Mulish-SemiBold.ttf",
          ),
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isLight ? Colors.grey.shade200 : Colors.white,
              width: 2,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isLight ? Colors.grey.shade200 : Colors.white,
              width: 2,
            ),
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
