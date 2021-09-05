import 'package:calculator/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function callback;
  final double size;
  final bool isDark;
  final int type;

  const CalcButton({
    required this.type,
    required this.isDark,
    this.size = 70,
    required this.text,
    this.textSize = 20,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:()=> callback(),
      child: Container(
        alignment: Alignment(0, 0),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isDark?KbtnColor:KbtnColor2,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: textSize,
            color:type==0?isDark? KtxtColor:KtxtColor2:type==1?KopColor:KsysColor,
          ),
        ),
      ),
    );
  }
}
