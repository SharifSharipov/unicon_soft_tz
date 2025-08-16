import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon_soft_tz/core/cammon/custom_button.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/features/description/presentation/widgets/description_body_widget.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  /*    int? id,
    String? title,
    String? description,
    String? startTime,
    String? color,
    int? isCompleted,*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Description', style: context.textStyle.appBarTitle),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: context.colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DescriptionBodyWidget(),
          CustomButton(text: "Edit", onTap: () {}).paddingOnly(bottom: 45),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
