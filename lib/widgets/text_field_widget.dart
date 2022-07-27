import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.iconOnTap,
    required this.obscureText,
    this.iconColor,
    this.iconSize,
    this.controller,
    this.validator,
    this.textInputType,
    this.onSaved
  }) : super(key: key);
  final String? hintText;
  final IconData? suffixIcon;
  final VoidCallback? iconOnTap;
  final bool obscureText;
  final Color? iconColor;
  final double? iconSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: textInputType,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: const Color(
        0xff292665,
      ),
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: iconOnTap,
          icon: Icon(
            suffixIcon,
            color: iconColor,
            size: iconSize,
          ),
        ),
        fillColor: const Color(0xfff2f2f2),
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        hintStyle: const TextStyle(
          color: Color(
            0xffdadada,
          ),
          fontFamily: 'Avenir',
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    );
  }
}
