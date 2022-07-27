import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    this.onTap,
    this.text,
    this.fontSize,
    this.textColor,
    this.backColor,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String? text;
  final Color? textColor;
  final Color? backColor;

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ),
      child: Text(
        text.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily: 'Avenir',
        ),
      ),
    );
  }
}
