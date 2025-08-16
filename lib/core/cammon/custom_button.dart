// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';
import 'package:unicon_soft_tz/core/cammon/custom_loading_widget.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.radius,
    this.bgColor,
    this.textColor,
    this.isLoading = false,
    this.paddingV,
    this.fontSize,
    this.colorL,
    this.icon,
    this.rightW,
    this.mainAxisAlignment,
    this.fontWeight,
    this.height,
    this.iconColor,
    this.dotedWith,
    this.dotedColor,
    this.borderColor,
  });

  final String text;
  final Function()? onTap;
  final double? radius;
  final double? paddingV;
  final double? fontSize;
  final Color? colorL;
  final String? icon;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final bool isLoading;
  final double? height;
  final double? dotedWith;
  final Color? dotedColor;
  final Widget? rightW;
  final MainAxisAlignment? mainAxisAlignment;
  final FontWeight? fontWeight;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      bound: 0.030,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 30),
        child: InkWell(
          splashColor: AppColors.white.withOpacity(.2),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 30),
          onTap: onTap,
          child: Ink(
            //  height: he(height ?? 45),
            padding: EdgeInsets.symmetric(
              vertical: isLoading ? 8 : paddingV ?? 12,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 30),
              color: bgColor ?? AppColors.c_222222,
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isLoading
                    ? SizedBox(
                        height: 29,
                        width: 29,
                        child: Center(child: LoadingWidget(color: colorL)),
                      )
                    : Center(
                        child: Row(
                          spacing: 10,
                          children: [
                            icon != null
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: SvgPicture.asset(
                                      height: 45,
                                      icon ?? "",
                                      colorFilter: iconColor == null
                                          ? null
                                          : ColorFilter.mode(
                                              iconColor!,
                                              BlendMode.srcIn,
                                            ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Text(
                              text,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: textColor ?? AppColors.white,
                                    fontWeight: fontWeight,
                                    fontSize: fontSize ?? 14,
                                  ),
                            ),
                            rightW ?? const SizedBox.shrink(),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
