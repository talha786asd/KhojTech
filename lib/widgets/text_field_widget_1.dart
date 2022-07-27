import 'package:flutter/material.dart';

class TextFieldWidget1 extends StatelessWidget {
  const TextFieldWidget1({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.iconOnTap,
    this.iconColor,
    this.iconSize,
    this.controller,
    this.validator,
  }) : super(key: key);
  final String? hintText;
  final IconData? prefixIcon;
  final VoidCallback? iconOnTap;
  final Color? iconColor;
  final double? iconSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
   

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: const Color(
        0xff292665,
      ),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: iconOnTap,
          icon: Icon(
            prefixIcon,
            color: iconColor,
            size: iconSize,
          ),
        ),
        fillColor: const Color(
          0xfff2f2f2,
        ),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(
            255,
            164,
            160,
            160,
          ),
          fontFamily: 'Avenir',
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ),
    );
  }
}
