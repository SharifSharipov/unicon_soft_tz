part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class DeleteTodoEvent extends HomeEvent {
  final int id;
  DeleteTodoEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class GetTodEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
class TodoIsCompletedEvent extends HomeEvent {
  final int id;
  final TodoModel todoModel;
  TodoIsCompletedEvent(this.id, this.todoModel);
  @override
  List<Object?> get props => [id, todoModel];
}
class RefreshTodosEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}