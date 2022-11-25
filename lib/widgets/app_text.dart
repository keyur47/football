import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? wordSpacing;
  final bool? softWrap;

  const AppText({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.softWrap,
    this.height,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily ?? AssetsPath.iBMPlexSans,
        color: color ?? AppColors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
