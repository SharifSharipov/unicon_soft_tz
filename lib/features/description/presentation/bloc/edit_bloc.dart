import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/constants/constants.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/description/domen/use_cases/edit_todo_usecase.dart';

part 'edit_event.dart';
part 'edit_state.dart';
part 'edit_bloc.freezed.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  final EditTodoUseCase useCase;
  EditBloc(this.useCase) : super(EditState()) {
    on<EditTodoEvent>(editTodo);
  }
  Future<void> editTodo(EditTodoEvent event, Emitter<EditState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await useCase.call(
      EditTodoParams(id: event.id, todoModel: event.todoModel),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(status: Status.error, failure: failure));
      },
      (id) {
        emit(
          state.copyWith(status: Status.success, todoModel: event.todoModel),
        );
      },
    );
  }
}
