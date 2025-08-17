import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon_soft_tz/constants/constants.dart';
import 'package:unicon_soft_tz/core/cammon/custom_button.dart';
import 'package:unicon_soft_tz/core/cammon/custom_prefix_text_field.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/description/presentation/bloc/edit_bloc.dart';
import 'package:unicon_soft_tz/features/description/presentation/pages/edit_page/edit_mixin.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> with EditMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBloc, EditState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text('Edit Task', style: context.textStyle.appBarTitle),
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
                text: "Edit todo",
                onTap: () {
                  context.read<EditBloc>().add(
                    EditTodoEvent(
                      todoModel: TodoModel(
                        id: widget.todoModel.id,
                        title: titleController.text.isNotEmpty
                            ? titleController.text
                            : widget.todoModel.title,
                        description: descriptionController.text.isNotEmpty
                            ? descriptionController.text
                            : widget.todoModel.description,
                        startTime: DateTime.now().toString(),
                        isCompleted: widget.todoModel.isCompleted,
                      ),
                      id: widget.todoModel.id ?? 0,
                    ),
                  );
                  context.pop();
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
