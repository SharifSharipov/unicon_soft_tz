// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/constants/constants.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/add_task/domen/use_cases/todo_use_case.dart';
import 'package:unicon_soft_tz/service/native_ui_bridge.dart';
part 'add_todo_event.dart';
part 'add_todo_state.dart';
part 'add_todo_bloc.freezed.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final TodoUseCase useCase;
  final UiControlBridge uiControlBridge;
  AddTodoBloc(this.useCase, this.uiControlBridge) : super(AddTodoState()) {
    on<AddTaskEvent>(addTodo);
  }
  Future<void> handleTaskNotification() async {
    await uiControlBridge.sendSingleNotification(
      title: 'Task added',
      message: 'Task added successfully',
    );
  }

  Future<void> addTodo(AddTaskEvent event, Emitter<AddTodoState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await useCase.call(
      TodoModelParams(todoModel: event.todoModel),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(status: Status.error, failure: failure));
      },
      (id) {
     handleTaskNotification() ;
        emit(
          state.copyWith(status: Status.success, todoModel: event.todoModel),
        );
      },
    );
  }
}
