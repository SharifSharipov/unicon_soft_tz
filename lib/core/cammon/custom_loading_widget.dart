import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: color ?? AppColors.white,
              strokeWidth: 2,
              backgroundColor: AppColors.black.withValues(alpha: 0.2),
            )
          : CupertinoActivityIndicator(color: color ?? AppColors.white),
    );
  }
}
