import 'package:flutter/material.dart';
import 'package:meeting_task/config/color.dart';
@immutable
class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {Key? key,
      required this.controller,
      required this.style,
      this.isIcon = false,
      this.onPress})
      : super(key: key);
  final TextEditingController controller;
  final TextStyle style;
  bool? isIcon ;
  GestureTapCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // cursorColor:smokyMint ,
      controller: controller,
      style: style,
      decoration: InputDecoration(
          suffixIcon: isIcon!
              ? GestureDetector(
                  onTap: onPress,
                  child: const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: smokyMint,))
              : null),
    );
  }
}
