part of 'edit_bloc.dart';

sealed class EditEvent extends Equatable {}

class EditTodoEvent extends EditEvent {
  final int id;
  final TodoModel todoModel;
  EditTodoEvent({required this.id, required this.todoModel});
  @override
  List<Object?> get props => [id, todoModel];
}