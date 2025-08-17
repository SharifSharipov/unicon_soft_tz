// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/constants/constants.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/features/home/domen/use_cases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:unicon_soft_tz/features/home/domen/use_cases/get_todo_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTodoUsecases getTodoUsecases;
  final DeleteTodoUsecase deleteTodoUsecases;

  HomeBloc(this.getTodoUsecases, this.deleteTodoUsecases) : super(const HomeState()) {
    on<GetTodEvent>(_onLoadTodos);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(
    GetTodEvent event,
    Emitter<HomeState> emit,
  ) async {
    // Agar todos allaqachon yuklangan bo'lsa, loading ko'rsatmaslik
    if (state.todos.isEmpty) {
      emit(state.copyWith(status: Status.loading));
    }
    
    final result = await getTodoUsecases(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.error,
        failure: failure,
      )),
      (todos) {
        debugPrint("Todos yuklandi: ${todos.length} ta");
        emit(state.copyWith(
          status: Status.success,
          todos: List<TodoEntity>.from(todos),
        ));
      }
    );
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<HomeState> emit,
  ) async {
    // Delete jarayonida loading ko'rsatmaslik, faqat optimistic update
    try {
      // 1. Darhol UI dan o'chirish (Optimistic Update)
      final updatedTodos = state.todos.where((todo) => todo.id != event.id).toList();
      emit(state.copyWith(
        status: Status.success,
        todos: updatedTodos,
      ));

      // 2. Server da o'chirish
      final result = await deleteTodoUsecases(DeleteTodoParams(id: event.id));
      
      result.fold(
        (failure) {
          // Agar xato bo'lsa, eski holatni qaytarish
          debugPrint("Delete xatosi: $failure");
          emit(state.copyWith(
            status: Status.error,
            failure: failure,
            todos: state.todos, // Eski todos ni qaytarish
          ));
          
          // Yoki server dan qayta yuklash
          add(GetTodEvent());
        },
        (_) {
          debugPrint("Todo muvaffaqiyatli o'chirildi: ${event.id}");
          // Allaqachon UI yangilangan, qo'shimcha ish kerak emas
        },
      );
    } catch (e) {
      debugPrint("Delete jarayonida xato: $e");
      // Xato holatida server dan qayta yuklash
      add(GetTodEvent());
    }
  }
}