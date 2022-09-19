import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_task/config/color.dart';
import 'package:meeting_task/config/font_style.dart';

class CustomSquareWidget extends StatelessWidget {
  const CustomSquareWidget(
      {Key? key,
      required this.isSelect,
      required this.isIcon,
      this.onTap,
      this.num,
      this.txt})
      : super(key: key);
  final bool isSelect;
  final bool isIcon;
  final GestureTapCallback? onTap;
  final String? num;
  final String? txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.0,
        height: 55.0,
        decoration: BoxDecoration(
          color: isSelect == true ? lightBlue : white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: smokyMint, style: BorderStyle.solid,width: 1.5),
        ),
        child: isIcon
            ? const Icon(
                Icons.add,
                color: white,
                size: 30,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    num!,
                    textAlign: TextAlign.center,
                    style: textThemeData.headline6!,
                  ),
                  Text(
                    txt!,
                    textAlign: TextAlign.center,
                    style: textThemeData.subtitle1,
                  ),
                ],
              ),
      ),
    );
  }
}
