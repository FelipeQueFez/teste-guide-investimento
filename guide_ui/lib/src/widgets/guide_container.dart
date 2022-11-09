import 'package:flutter/material.dart';

class GuideContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? customMargin;

  const GuideContainer({Key? key, required this.child, this.customMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: customMargin ?? EdgeInsets.all(15),
      child: child,
    );
  }
}
