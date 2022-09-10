import 'package:flutter/material.dart';

class CurveClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path = Path();
    path.lineTo(0,0);
           path.quadraticBezierTo(0,size.height*0.3855000,0,size.height*0.5380000);
           path.cubicTo(0,size.height*1.0515000,size.width*0.9750000,size.height*0.6105000,size.width,size.height*0.9500000);
           path.cubicTo(size.width,size.height*0.8,size.width*1,size.height*0.5,size.width,size.height*0.5);
           path.cubicTo(size.width,size.height*0.2,size.width,size.height*0.23,size.width*0.8,size.height*0.24);
           path.cubicTo(size.width*0.6,size.height*0.2,size.width*0.8,0,size.width*0.6,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper)=> true;
}