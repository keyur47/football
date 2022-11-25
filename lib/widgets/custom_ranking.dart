import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomRanking extends StatelessWidget {
  const CustomRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 51.3,
          child: AppText(
            text: StringsUtils.team,
            fontSize: SizeUtils.fSize_12(),
            color: AppColors.black,
          ),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 5,
          child: AppText(
            text: StringsUtils.Pt,
            textAlign: TextAlign.end,
            color: AppColors.black,
            fontSize: SizeUtils.fSize_12(),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 5,
          child: AppText(
            text: StringsUtils.P,
            textAlign: TextAlign.end,
            fontSize: SizeUtils.fSize_12(),
            color: AppColors.black,
          ),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 5,
          child: AppText(
            text: StringsUtils.W,
            textAlign: TextAlign.end,
            fontSize: SizeUtils.fSize_12(),
            color: AppColors.black,
          ),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 5,
          child: AppText(
            text: StringsUtils.D,
            textAlign: TextAlign.end,
            color: AppColors.black,
            fontSize: SizeUtils.fSize_12(),
          ),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 5,
          child: AppText(
            text: StringsUtils.L,
            textAlign: TextAlign.end,
            color: AppColors.black,
            fontSize: SizeUtils.fSize_12(),
          ),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 5,
          child: AppText(
            text: StringsUtils.sub,
            textAlign: TextAlign.end,
            fontSize: SizeUtils.fSize_12(),
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}

Widget customRankingBox({
  String? name,
  int? index,
  int? pt,
  int? p,
  int? w,
  int? d,
  int? l,
  int? sub,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 7,
        child: AppText(
          text: "$index",
          maxLines: 1,
          fontSize: SizeUtils.fSize_12(),
          color: AppColors.black,
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 43.5,
        child: AppText(
          text: "$name",
          fontSize: SizeUtils.fSize_12(),
          maxLines: 1,
          color: AppColors.black,
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 5,
        child: AppText(
          text: "$pt",
          textAlign: TextAlign.end,
          color: AppColors.black,
          fontSize: SizeUtils.fSize_12(),
          maxLines: 1,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 5,
        child: AppText(
          text: "$p",
          maxLines: 1,
          textAlign: TextAlign.end,
          fontSize: SizeUtils.fSize_12(),
          color: AppColors.black,
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 5,
        child: AppText(
          text: "$w",
          maxLines: 1,
          textAlign: TextAlign.end,
          color: AppColors.black,
          fontSize: SizeUtils.fSize_12(),
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 5,
        child: AppText(
          text: "$d",
          maxLines: 1,
          textAlign: TextAlign.end,
          fontSize: SizeUtils.fSize_12(),
          color: AppColors.black,
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 5,
        child: AppText(
          text: "$l",
          maxLines: 1,
          textAlign: TextAlign.end,
          color: AppColors.black,
          fontSize: SizeUtils.fSize_12(),
        ),
      ),
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 5,
        child: AppText(
          text: "$sub",
          maxLines: 1,
          fontSize: SizeUtils.fSize_12(),
          textAlign: TextAlign.end,
          color: AppColors.black,
        ),
      ),
    ],
  );
}
