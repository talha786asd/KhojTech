import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  Widget? child;
  bool? inAsyncCall;
  double opacity;
  Color color;
  Animation<Color>? valueColor;

  ProgressHUD({
    Key? key,
    this.child,
    this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child!);
    if (inAsyncCall!) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
              child: new CircularProgressIndicator(
            color: Color(
              0xff292665,
            ),
          )),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
