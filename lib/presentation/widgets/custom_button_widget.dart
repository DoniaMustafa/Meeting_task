import 'package:flutter/material.dart';
import 'package:meeting_task/config/color.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget(
      {Key? key,
      required this.txt,
      required this.onPress,
      required this.style,
      this.isSelect})
      : super(key: key);
  final String txt;
  final VoidCallback onPress;
  bool? isSelect = true;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: lightMint,),
          color:isSelect! ? smokyMint : Colors.white

      ),
      child: MaterialButton(
        onPressed:onPress,
        child: Text(txt,style:style,),

      ),
    );
  }
}
