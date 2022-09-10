import 'package:flutter/material.dart';

class CustomTextTitleWidget extends StatelessWidget {
  const CustomTextTitleWidget({Key? key,required this.title,required this.style}) : super(key: key);
final String title;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: style
    );
  }
}
