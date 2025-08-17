import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/features/home/presentation/bloc/home_bloc.dart';
import 'package:unicon_soft_tz/features/home/presentation/pages/home_page.dart';

mixin HomeMixn on State<HomePage> implements WidgetsBindingObserver {

  int counter(List<TodoEntity> element) {
    return element.where((e) => e.isCompleted == 1).length;
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<HomeBloc>().add(GetTodEvent());
  }

}
