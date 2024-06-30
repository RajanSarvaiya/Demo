import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  CardView(
      {this.child,
        this.color = Colors.white,
        this.radiusbottomLeft = 8,
        this.radiusbottomRight = 8,
        this.radiustopLeft = 8,
        this.radiustopRight = 8});

  final Widget? child;
  final Color? color;
  double? radiusbottomLeft;
  double? radiusbottomRight;
  double? radiustopRight;
  double? radiustopLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radiusbottomLeft!),
              bottomRight: Radius.circular(radiusbottomRight!),
              topLeft: Radius.circular(radiustopLeft!),
              topRight: Radius.circular(radiustopRight!)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]),
      child: child,
    );
  }
}