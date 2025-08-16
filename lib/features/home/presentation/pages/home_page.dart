import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/utils/app_utils.dart';
import 'package:unicon_soft_tz/features/home/presentation/pages/home_mixn.dart';
import 'package:unicon_soft_tz/features/home/presentation/widgets/task_type_widget.dart';
import 'package:unicon_soft_tz/router/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixn {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page', style: context.textStyle.appBarTitle),
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.addTask);
            },
            child: Text("add task +", style: context.textStyle.bodySubheadline),
          ),
        ],
      ),
      backgroundColor: context.colorScheme.surface,
      body: Column(
        children: [
          Row(
            spacing: 5,
            children: [
              TaskTypeWidget(
                tasknName: "x=>total",
                taskCount: '10',
                color: const Color.fromARGB(255, 192, 120, 19),
              ),
              TaskTypeWidget(
                tasknName: "y=>done",
                taskCount: '10',
                color: const Color.fromARGB(255, 4, 254, 142),
              ),
              TaskTypeWidget(
                tasknName: "z=>not done",
                taskCount: '10',
                color: AppColors.red,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 4, 254, 142),
                    borderRadius: AppUtils.kBorderRadius14,
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
