import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.backGroundColor,
    this.title,
    this.leading,
    this.leadingIconColor,
    this.action,
    this.centerTitle,
    this.elevation,
    this.leadingWidth,
    this.shadowColor,
    this.bottom,
    this.appBarSize,
    this.toolbarHeight,
    this.automaticallyImplyLeading,
  }) : super(key: key);

  final Color? backGroundColor;
  final Color? shadowColor;
  final Color? leadingIconColor;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? action;
  final double? elevation;
  final double? leadingWidth;
  final double? appBarSize;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: backGroundColor ?? AppColors.primaryColor,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 2.2,
        ),
        child: title,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      leading: (automaticallyImplyLeading ?? true) && leading == null
          ? IconButton(
              icon: ImageIcon(
                const AssetImage(
                  AssetsPath.leftArrowForward,
                ),
                size: SizeUtils.horizontalBlockSize * 4,
              ),
              onPressed: () {
                Get.back();
              },
            )
          : leading,
      actions: action,
      elevation: elevation ?? 0,
      centerTitle: centerTitle ?? false,
      shadowColor: shadowColor ?? AppColors.white[30],
      leadingWidth: leadingWidth,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarSize ?? 58);
}
