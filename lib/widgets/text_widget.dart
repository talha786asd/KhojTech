import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : super(key: key);

  final String? text;
  final int? maxLines;
  final TextDecoration? decoration;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          overflow: overflow,
          decoration: decoration,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Avenir',
        ),
    );
  }
}
