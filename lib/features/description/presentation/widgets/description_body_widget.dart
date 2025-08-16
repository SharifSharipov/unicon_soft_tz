import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/utils/app_utils.dart';

class DescriptionBodyWidget extends StatelessWidget {
  const DescriptionBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: AppUtils.kBorderRadius14,
        ),
        child: Column(
          spacing: 10,
          children: [
            Text(
              "Flutter developer with 3+ years of experience. Shipped a high-load app (200K+ installs) with Google/Yandex Maps, background services, real-time (WebSockets), Firebase, push, and local storage (Hive/Isar/SQFlite). Strong in Clean Architecture and BLoC, native integrations via platform channels, and CI/CD. Based in Tashkent; open to relocate (AM/GE/KZ/KG).",
              style: context.textStyle.bodyBody.copyWith(
                color: AppColors.c_ebebeb,
              ),
              textAlign: TextAlign.justify,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Is completed: false",
                  style: context.textStyle.bodyBody.copyWith(
                    color: AppColors.c_ebebeb,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "Data:11.08.2023",
                  style: context.textStyle.bodyBody.copyWith(
                    color: AppColors.c_ebebeb,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 8),
      ),
    );
  }
}
