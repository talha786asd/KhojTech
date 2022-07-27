import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    this.onTap,
    this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.decoration,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text.toString(),
        
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
          fontFamily: 'Avenir'
        ),
      ),
    );
  }
}
