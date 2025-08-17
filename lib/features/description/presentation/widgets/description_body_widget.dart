import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/utils/app_utils.dart';
import 'package:unicon_soft_tz/core/utils/date_time_convertor.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';

class DescriptionBodyWidget extends StatelessWidget {
  const DescriptionBodyWidget({super.key, required this.todo});
  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {

    String convertToString(bool value) {
      switch (value) {
        case false:
          return "Task not completed";
        case true:
          return "Task completed";
      }
    }

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: AppUtils.kBorderRadius14,
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             todo.description,
              style: context.textStyle.bodyBody.copyWith(
                color: AppColors.c_ebebeb,
              ),
              textAlign: TextAlign.justify,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Is completed:${convertToString(todo.isCompleted)}",
                  style: context.textStyle.bodyBody.copyWith(
                    color: AppColors.c_ebebeb,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                   DateTimeConverter.formatFromString(todo.startTime),
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
