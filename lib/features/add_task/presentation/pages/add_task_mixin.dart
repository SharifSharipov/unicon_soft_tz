import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/features/add_task/presentation/pages/add_task_page.dart';

mixin AddTaskMixin on State<AddTaskPage> {
  Brightness get brightness => Theme.of(context).brightness;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late FocusNode titleFocusNode;
  late FocusNode descriptionFocusNode;
  void initController() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleFocusNode = FocusNode();
    descriptionFocusNode = FocusNode();
  }

  @override
  void initState() {
    initController();
    super.initState();
  }
  void disposeController() {
    titleController.dispose();
    descriptionController.dispose();
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
