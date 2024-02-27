import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String? textOne;
  final String textTwo;
  final double sizeOne;
  final double sizeTwo;
  final FontWeight weightOne;
  final FontWeight weightTwo;
  final Color colorOne;
  final Color colorTwo;
  const AppRichText(
      {super.key,
      required this.textOne,
      this.textTwo = "℃",
      this.sizeOne = 23,
      this.sizeTwo = 15,
      this.weightOne = FontWeight.w600,
      this.weightTwo = FontWeight.normal,
      this.colorOne = Colors.black,
      this.colorTwo = Colors.black});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textOne,
        children: [
          TextSpan(
            text: textTwo,
            style: TextStyle(
                color: colorTwo,
                fontSize: sizeTwo,
                fontWeight: weightTwo,
                fontFamily: 'Noto Sans JP'),
          )
        ],
        style: TextStyle(
          color: colorOne,
          fontSize: sizeOne,
          fontWeight: weightOne,
          fontFamily: 'Noto Sans JP',
        ),
      ),
    );
  }
}
