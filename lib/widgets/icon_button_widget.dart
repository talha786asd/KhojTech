import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
    this.onTap,
    this.icon,
    this.color,
    this.iconSize,
  }) : super(key: key);
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(
        0,
      ),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}
