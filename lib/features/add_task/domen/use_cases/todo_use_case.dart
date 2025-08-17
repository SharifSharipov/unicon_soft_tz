import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/add_task/domen/repositories/todo_repositories.dart';

part 'todo_use_case.freezed.dart';
part 'todo_use_case.g.dart';

class TodoUseCase extends UseCase<int, TodoModelParams> {
  final AddTodoRepositories _repository;
  
  TodoUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(TodoModelParams params) async {
    return _repository.add(model: params.todoModel);
  }
}

@freezed
class TodoModelParams with _$TodoModelParams {
  const factory TodoModelParams({
    required TodoModel todoModel,
  }) = _TodoModelParams; 

  factory TodoModelParams.fromJson(Map<String, dynamic> json) =>
      _$TodoModelParamsFromJson(json);
}