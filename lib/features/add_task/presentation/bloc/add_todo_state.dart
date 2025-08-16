part of 'add_todo_bloc.dart';

@freezed
class AddTodoState with _$AddTodoState {
  const factory AddTodoState({
    @Default(UnknownFailure()) Failure failure, 
    @Default(Status.initial) Status status,
    TodoModel? todoModel,
  }) = _AddTodoState;
}
