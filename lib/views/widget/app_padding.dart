import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final List<Widget> content;

  final double top;
  final double right;
  final double bottom;
  final double left;
  const AppPadding(
      {super.key,
      required this.content,
      this.top = 0.0,
      this.right = 10,
      this.bottom = 0.0,
      this.left = 0.0});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin:
            EdgeInsets.only(top: top, right: right, bottom: bottom, left: left),
        child: Column(
          children: content,
        ),
      ),
    );
  }
}
