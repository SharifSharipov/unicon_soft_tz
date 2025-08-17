import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon_soft_tz/core/cammon/custom_button.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/description/presentation/widgets/description_body_widget.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/router/routes.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.todo});
  final TodoEntity todo;
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
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
        title: Text(widget.todo.title, style: context.textStyle.appBarTitle),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: context.colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DescriptionBodyWidget(todo: widget.todo),
          CustomButton(
            text: "Edit",
            onTap: () {
              context.pushNamed(Routes.editTask, extra: widget.todo.toModel());
            },
          ).paddingOnly(bottom: 45),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
