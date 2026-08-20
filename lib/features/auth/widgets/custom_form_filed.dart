import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      width: double.infinity,
      height: 42,
      child: TextFormField(
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: "Mulish",
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: _toggleObscure,
                  child: Icon(CupertinoIcons.eye),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
