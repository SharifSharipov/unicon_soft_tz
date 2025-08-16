// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/themes/themes.dart';
import 'package:unicon_soft_tz/core/utils/app_utils.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.onChange,
    required this.hintText,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscure,
    this.textInputAction,
    this.fillColor,
    this.initialValue,
    this.preIconColor,
    this.textEditingController,
    this.readOnly = false,
    this.onTap,
    this.formatter,
    required this.textInputType,
    this.maxLength,
    this.focusNode,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController? textEditingController;
  Function(String value)? onChange;
  final String hintText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? preIconColor;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final TextInputType textInputType;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function()? onTap;
  final List<TextInputFormatter>? formatter;
  final AutovalidateMode autoValidateMode;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    ThemeTextStyles themeTextStyles =
        Theme.of(context).extension<ThemeTextStyles>()!;
    bool hasDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      validator: validator,
      readOnly: readOnly,
      focusNode: focusNode,
      inputFormatters: formatter,
      onTap: onTap,
      initialValue: initialValue,
      style: themeTextStyles.regularCallout,
      obscureText: obscure ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      onChanged: onChange,
      controller: textEditingController,
      cursorColor: AppColors.primary,
      maxLength: maxLength,
      autovalidateMode: autoValidateMode,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        contentPadding:AppUtils.kPaddingHor16Ver14,
          //  EdgeInsets.symmetric(horizontal: wi(16), vertical: he(14)),
        counterText: '',
        suffixIconConstraints:
            BoxConstraints(minHeight: 25, minWidth: 25),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  prefixIcon ?? "",
                  colorFilter: ColorFilter.mode(
                      preIconColor ?? AppColors.iconGray, BlendMode.srcIn),
                ),
              ),
        suffixIcon: suffixIcon?.paddingOnly(right: 16),
        hintStyle: themeTextStyles.regularCallout
            .copyWith(color: hasDark ? AppColors.c_515966 : AppColors.textGray),
        hintText: hintText,
        errorStyle: themeTextStyles.regularCallout
            .copyWith(color: AppColors.red.withOpacity(.5)),
        filled: true,
        fillColor:
            fillColor ?? (hasDark ? AppColors.c_1a1c1f : AppColors.c_e5eafo),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
              color: hasDark ? AppColors.c_1a1c1f : AppColors.c_e5eafo),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
              color: hasDark ? AppColors.c_1a1c1f : AppColors.c_e5eafo),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: hasDark ? AppColors.c_515966 : AppColors.c_b3b7bf,
            width: 1.2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
              color: hasDark ? AppColors.c_1a1c1f : AppColors.c_e5eafo),
        ),
      ),
    );
  }
}
