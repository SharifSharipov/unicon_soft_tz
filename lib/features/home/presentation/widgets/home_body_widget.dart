import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/utils/app_utils.dart';
import 'package:unicon_soft_tz/core/utils/date_time_convertor.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';

class HomeBodyWidget extends StatelessWidget {
  final TodoEntity todo;
  const HomeBodyWidget({super.key, required this.todo, required this.onLongPress, required this.onTap});
  final VoidCallback onLongPress;
  final VoidCallback onTap;

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

    return GestureDetector(
      onLongPress: onLongPress,
      onTap:onTap ,
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius14,
            color: Colors.blueAccent,
          ),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: context.textStyle.bodyBody.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                todo.description,
                style: context.textStyle.bodyBody.copyWith(
                  color: AppColors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    convertToString(todo.isCompleted),
      
                    style: context.textStyle.bodyBody.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    DateTimeConverter.formatFromString(todo.startTime),
      
                    style: context.textStyle.bodyBody.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 8),
        ),
      ).paddingOnly(bottom: 10),
    );
  }
}
