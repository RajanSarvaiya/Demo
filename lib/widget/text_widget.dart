import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({
    this.text,
    this.textAlign = TextAlign.start,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.fontsize = 10,
    this.textOverFlow = TextOverflow.visible,
    this.maxLines,
  });

  final String? text;
  final TextAlign textAlign;
  final Color color;
  final String? fontFamily;
  final TextOverflow textOverFlow;
  final double fontsize;
  final FontWeight fontWeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      overflow: textOverFlow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
