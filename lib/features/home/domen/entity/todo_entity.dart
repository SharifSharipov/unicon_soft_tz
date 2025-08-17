import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String startTime;
  final int isCompleted;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, title, description, startTime, isCompleted];
}
