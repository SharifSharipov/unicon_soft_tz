import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/features/home/presentation/bloc/home_bloc.dart';
import 'package:unicon_soft_tz/features/home/presentation/pages/home_page.dart';

mixin HomeMixn on State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetTodEvent());
    super.initState();
  }

  int counter(List<TodoEntity> element) {
    int count = 0;
    for (var i = 0; i < element.length; i++) {
      if (element[i].isCompleted == 1) {
        count++;
      }
    }
    return count;
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    context.read<HomeBloc>().add(GetTodEvent());
    super.didUpdateWidget(oldWidget);
  }
}
