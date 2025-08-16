import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/utils/app_utils.dart';

class TaskTypeWidget extends StatelessWidget {
  const TaskTypeWidget({
    super.key,
    required this.tasknName,
    required this.taskCount,
    required this.color,
  });
  final String tasknName;
  final String taskCount;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tasknName,
            style: context.textStyle.bodyLargeTitle.copyWith(
              color: color,
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: AppUtils.kBorderRadius14,
              ),
              child: Text(
                taskCount,
                style: context.textStyle.bodyBody.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ).paddingSymmetric(vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
