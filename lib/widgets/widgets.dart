import 'package:flutter/material.dart';

Widget bigText({
  Color color = const Color(0xFF332d2b) ,
  required String text ,
  double size =0 ,
  TextOverflow textOverflow = TextOverflow.ellipsis
}) => Text( '$text' ,
  overflow: textOverflow,
  maxLines: 1,
  style: TextStyle (
      fontFamily: 'Roboto',
      color: color ,
      fontSize: size==0?20 :size,
      fontWeight: FontWeight.w400
  ),
);

Widget smallText({
  Color color = const Color(0xFFccc7c5) ,
  required String text ,
  double hight =1.2 ,
  double size =12 ,
}) => Text( '$text' ,
  style: TextStyle (
      fontFamily: 'Roboto',
      color: color ,
      fontSize: size ,
      height: hight
  ),
);
