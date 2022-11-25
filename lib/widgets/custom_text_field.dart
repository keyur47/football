import 'package:football/utils/app_colors.dart';
import 'package:football/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final Color fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final Color? focusedBorderColor;
  final String? hint;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enable;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? errorText;
  final Function(String)? onChange;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final FormFieldValidator<String>? validator;

  const CustomTextField(
      {Key? key,
      this.textInputFormatter,
      this.width,
      this.suffixIcon,
      this.focusNode,
      this.hint,
      this.leadingIcon,
      this.trailingIcon,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.enable = true,
      this.readOnly = false,
      this.maxLines,
      this.height,
      this.hintStyle,
      this.textStyle,
      this.filled,
      this.contentPadding,
      this.onTap,
      this.maxLength,
      this.borderRadius = 12,
      this.errorText = '',
      this.fillColor = Colors.transparent,
      this.focusedBorderColor = Colors.transparent,
      this.borderColor = Colors.transparent,
      this.onChange})
      : super(key: key);

  @override
  _AuthInputFieldState createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<CustomTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height != null
          ? widget.height! > 10
              ? widget.height
              : 10
          : null,
      width: widget.width,
      //--- height can not be less than 20 otherwise we have to make the text font size too small
      child: TextFormField(
        cursorColor: AppColors.black,
        validator: widget.validator,
        inputFormatters: widget.textInputFormatter,
        onTap: widget.onTap,
        onChanged: widget.onChange,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly!,
        focusNode: widget.focusNode,
        maxLines: obscure == true ? 1 : widget.maxLines,
        enabled: widget.enable,
        controller: widget.controller,
        textAlign: TextAlign.start,
        style: widget.textStyle ?? AppTextStyle.bodySemiBold[18]?.copyWith(color: AppColors.grey[80]),
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure ? obscure : widget.obscure,
        // obscure for password fields
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        // expands: true,
        decoration: InputDecoration(
          counterText: "",
          // isCollapsed: true,
          // isDense: true,
          errorText: widget.errorText != '' ? widget.errorText : null,
          errorStyle: AppTextStyle.bodyRegular[12]?.copyWith(color: AppColors.red),
          errorMaxLines: 2,
          contentPadding: widget.contentPadding,
          hintText: widget.hint,
          alignLabelWithHint: true,
          hintStyle: widget.hintStyle ?? AppTextStyle.bodySemiBold[18]?.copyWith(color: AppColors.grey[80]),
          fillColor: widget.fillColor,
          filled: widget.filled ?? true,
          border: borderDecoration(borderColor: widget.borderColor),
          disabledBorder: disabledBorderDecoration(borderColor: widget.borderColor),
          enabledBorder: enabledBorderDecoration(borderColor: widget.borderColor),
          focusedBorder: focusedBorderDecoration(focusedBorderColor: widget.focusedBorderColor),
          errorBorder: errorBorderDecoration(borderColor: widget.borderColor),
          prefixIconConstraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.width * 0.5,
            maxWidth: MediaQuery.of(context).size.width * 0.5,
          ),

          prefixIcon: widget.leadingIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: widget.leadingIcon,
                )
              : null,
          suffixIcon: widget.obscure == false && widget.trailingIcon == null
              ? null
              : widget.trailingIcon ??
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: IconTheme.of(context).color,
                    ),
                  ),
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(width: 1.0, color: borderColor ?? AppColors.grey[80]!),
    );
  }

  OutlineInputBorder disabledBorderDecoration({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(width: 1.0, color: borderColor ?? AppColors.grey[80]!),
    );
  }

  OutlineInputBorder enabledBorderDecoration({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(width: 1.0, color: borderColor ?? AppColors.grey[80]!),
    );
  }

  OutlineInputBorder focusedBorderDecoration({Color? focusedBorderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(width: 1.0, color: focusedBorderColor ?? AppColors.grey[80]!),
    );
  }

  OutlineInputBorder errorBorderDecoration({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(width: 1.0, color: borderColor ?? AppColors.grey[80]!),
    );
  }
}
