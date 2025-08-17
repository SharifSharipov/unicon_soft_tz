// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_todo_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditTodoParamsImpl _$$EditTodoParamsImplFromJson(Map<String, dynamic> json) =>
    _$EditTodoParamsImpl(
      id: (json['id'] as num).toInt(),
      todoModel: TodoModel.fromJson(json['todoModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EditTodoParamsImplToJson(
  _$EditTodoParamsImpl instance,
) => <String, dynamic>{'id': instance.id, 'todoModel': instance.todoModel};
