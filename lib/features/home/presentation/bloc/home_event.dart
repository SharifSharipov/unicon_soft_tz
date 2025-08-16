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
