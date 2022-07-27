import 'package:flutter/material.dart';

class RichTextButtonWidget extends StatelessWidget {
  const RichTextButtonWidget({
    Key? key,
    this.text1,
    this.text2,
    this.color1,
    this.color2,
    this.fontSize1,
    this.fontSize2,
    this.fontWeight1,
    this.fontWeight2,
    this.onTap,
  }) : super(key: key);
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  final double? fontSize1;
  final double? fontSize2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: TextStyle(
                color: color1,
                fontSize: fontSize1,
                fontFamily: 'Avenir',
              ),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                color: color2,
                decoration: TextDecoration.underline,
                fontSize: fontSize2,
                fontFamily: 'Avenir',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
