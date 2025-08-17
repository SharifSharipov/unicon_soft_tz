// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/constants/constants.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/features/home/domen/use_cases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:unicon_soft_tz/features/home/domen/use_cases/edit_complated_usce_case/edit_complated_usce_case.dart';
import 'package:unicon_soft_tz/features/home/domen/use_cases/get_todo_usecases.dart';

import '../../../../service/native_ui_bridge.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTodoUsecases getTodoUsecases;
  final DeleteTodoUsecase deleteTodoUsecases;
  final EditCompletedUseCase editCompletedUseCase;
  final UiControlBridge uiControlBridge;

  HomeBloc(this.getTodoUsecases, this.deleteTodoUsecases, this.editCompletedUseCase,this.uiControlBridge)
      : super(const HomeState()) {
    on<GetTodEvent>(_onLoadTodos);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<TodoIsCompletedEvent>(_editCompleted);
    on<RefreshTodosEvent>(_onRefreshTodos);
  }

  Future<void> _onLoadTodos(GetTodEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await getTodoUsecases(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(status: Status.error, failure: failure)),
      (todos)=> emit(state.copyWith(
          status: Status.success,
          todos: List<TodoEntity>.from(todos),
        )),
    );
  }

  Future<void> _onDeleteTodo(DeleteTodoEvent event, Emitter<HomeState> emit) async {
    try {
      final updatedTodos = state.todos.where((todo) => todo.id != event.id).toList();
      emit(state.copyWith(status: Status.success, todos: updatedTodos));
      final result = await deleteTodoUsecases(DeleteTodoParams(id: event.id));
      result.fold(
        (failure) {
          debugPrint("O'chirish xatosi: $failure");
          emit(state.copyWith(
            status: Status.error,
            failure: failure,
            todos: state.todos,
          ));
          add(GetTodEvent());
        },
        (_) => debugPrint("Todo muvaffaqiyatli o'chirildi: ${event.id}"),
      );
    } catch (e) {
      debugPrint("O'chirish jarayonida xato: $e");
      emit(state.copyWith(status: Status.error, failure: UnknownFailure()));
      add(GetTodEvent());
    }
  }
  Future<void> handleTaskNotification() async {
    await uiControlBridge.sendSingleNotification(
      title: 'Task completed',
      message: 'Task completed successfully',
    );
  }
  Future<void> _editCompleted(TodoIsCompletedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await editCompletedUseCase(EditCompletedParams(id: event.id, todoModel: event.todoModel));
    result.fold(
      (failure) {
        debugPrint("Tahrirlash xatosi: $failure");
        emit(state.copyWith(status: Status.error, failure: failure));
      },
      (_)async {
        final updatedTodos = state.todos.map((todo) {
      
          return todo;
        }).toList();

        emit(state.copyWith(
          status: Status.success,
          todos: updatedTodos,
          todo: null,
        ));
        handleTaskNotification();
        debugPrint("Todo holati o'zgartirildi: ${event.id}");
      },
    );
  }

  Future<void> _onRefreshTodos(RefreshTodosEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await getTodoUsecases(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(status: Status.error, failure: failure)),
      (todos) => emit(state.copyWith(
        status: Status.success,
        todos: List<TodoEntity>.from(todos),
      )),
    );
  }
}