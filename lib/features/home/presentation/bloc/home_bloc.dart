// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    emit(state.copyWith(status: Status.loading));
    final result = await getTodoUsecases(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.error,
        failure: failure,
      )),
      (todos) => emit(state.copyWith(
        status: Status.success,
        todos: todos,
      )),
    );
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await deleteTodoUsecases(DeleteTodoParams(id: event.id));
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.error,
        failure: failure,
      )),
      (_) {
        add(GetTodEvent());
      },
    );
  }
}
