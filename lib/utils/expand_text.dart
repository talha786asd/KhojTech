import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExpandText extends StatefulWidget {
  ExpandText({Key? key, this.desc, this.labelHeader, this.shortDesc})
      : super(key: key);

  String? labelHeader;
  String? desc;
  String? shortDesc;

  @override
  State<ExpandText> createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  bool descTextShowFlag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
             widget.labelHeader!,
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Html(
            data: descTextShowFlag ?  widget.desc :  widget.shortDesc,
            style: {
              "div": Style(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  fontSize: FontSize.medium)
            },
          ),
          Align(
            child: GestureDetector(
              child: Text(
                descTextShowFlag ? "Show Less" : "Show More",
                style: const TextStyle(
                  color: Color(
                    0xff292665,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  descTextShowFlag = !descTextShowFlag;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
