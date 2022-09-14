import 'package:flutter/material.dart';
import 'package:meeting_task/config/color.dart';
import 'package:meeting_task/config/font_style.dart';

class CustomSquareWidget extends StatelessWidget {
  CustomSquareWidget({Key? key, required this.isSelect,required this.isIcon, this.onTap,  this.num,  this.txt}) : super(key: key);
  final bool isSelect;
  final bool isIcon;
 final  GestureTapCallback? onTap;
 final String? num;
 final String? txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.fromLTRB(20.0,10.0,5.0,20.0,),
        padding:const EdgeInsets.all(10.0),
        // height: 15,
        //   width: 15,
        decoration: BoxDecoration(
          color:isSelect ? lightBlue : white ,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: smokyMint,
              style: BorderStyle.solid),
        ),
        child: isIcon? Icon(Icons.add,color: white,size: 30,):
        Column(
          children: [
            Expanded(child: Text(num!,textAlign: TextAlign.center,style: textThemeData.headline6!,)),
             // SizedBox(height: 5,),
            Expanded(child: Text(txt!,textAlign: TextAlign.center,style: textThemeData.bodyText1!,)),
          ],
        ),
      ),
    );
  }
}
