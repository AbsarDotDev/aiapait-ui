import 'package:aiapait/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? color;
  final bool? isLink;
  final String? fonFamily;
  const CustomText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.color = 0xff000000,
      this.fontWeight = FontWeight.normal,
      this.fonFamily = 'Poppins',
      this.isLink});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(color!),
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fonFamily,
          decoration: isLink == true ? TextDecoration.underline : null,
          decorationColor: isLink == true ? Color(AppColors.primary) : null),
    );
  }
}
