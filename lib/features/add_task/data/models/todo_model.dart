import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';

class TodoModel {
  final int? id;
  final String title;
  final String description;
  final String startTime;
  final int isCompleted;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.isCompleted,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? startTime,
    int? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startTime: json['start_time'] as String? ?? '',
      isCompleted: json['is_completed'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'start_time': startTime,
      'is_completed': isCompleted,
    };
  }
  
}
extension TodoModelX on TodoModel {
  TodoEntity toEntity() {
    return TodoEntity(
      id: id ?? 0,
      title: title,
      description: description,
      startTime: startTime,
      isCompleted: isCompleted, 
    );
  }
}

extension TodoEntityX on TodoEntity {
  TodoModel toModel() {
    return TodoModel(
      id: id,
      title: title,
      description: description,
      startTime: startTime,
      isCompleted:isCompleted, 
    );
  }
}
