import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon_soft_tz/constants/constants.dart' show Status;
import 'package:unicon_soft_tz/core/cammon/custom_button.dart';
import 'package:unicon_soft_tz/core/cammon/custom_prefix_text_field.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/helper/helper.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/add_task/presentation/bloc/add_todo_bloc.dart';
import 'package:unicon_soft_tz/features/add_task/presentation/pages/add_task_mixin.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> with AddTaskMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTodoBloc, AddTodoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              context.pop();
            }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
            title: Text('Add Task', style: context.textStyle.appBarTitle),
            centerTitle: true,
          ),
          backgroundColor: context.colorScheme.surface,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 10,
                children: [
                  CustomTextField(
                    hintText: "Title",
                    textInputType: TextInputType.text,
                    textEditingController: titleController,
                    focusNode: titleFocusNode,
                    textInputAction: TextInputAction.next,
                  ).paddingOnly(top: 15),
                  CustomTextField(
                    hintText: "Description",
                    textInputType: TextInputType.text,
                    textEditingController: descriptionController,
                    focusNode: descriptionFocusNode,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              CustomButton(
                text: "Save",
                onTap: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    context.read<AddTodoBloc>().add(
                      AddTaskEvent(
                        todoModel: TodoModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          startTime: DateTime.now().toString(),
                          isCompleted: 0,
                        ),
                      ),
                    );
                    context.pop();
                  } else {
                    Helper.showToast(
                      message: "Please fill all fields",
                      themeController: brightness == Brightness.light,
                    );
                  }
                },
                isLoading: state.status == Status.loading,
              ).paddingOnly(bottom: 35),
            ],
          ).paddingSymmetric(horizontal: 16),
        );
      },
    );
  }
}
