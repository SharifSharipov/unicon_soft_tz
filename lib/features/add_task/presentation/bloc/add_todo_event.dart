part of 'add_todo_bloc.dart';

sealed class AddTodoEvent extends Equatable {}

class AddTaskEvent extends AddTodoEvent {
  final TodoModel todoModel;
  AddTaskEvent({required this.todoModel});
  @override
  List<Object?> get props => [todoModel];
}
