import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/description/domen/repositories/description_repositories.dart';

part 'edit_todo_usecase.freezed.dart';
part 'edit_todo_usecase.g.dart';

class EditTodoUseCase extends UseCase<int, EditTodoParams> {
  final DescriptionRepositories _repository;

  EditTodoUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(EditTodoParams params) async {
    return _repository.edit(id: params.id, todoModel: params.todoModel);
  }
}

@freezed
class EditTodoParams with _$EditTodoParams {
  const factory EditTodoParams({
    required int id,
    required TodoModel todoModel,
  }) = _EditTodoParams;

  factory EditTodoParams.fromJson(Map<String, dynamic> json) =>
      _$EditTodoParamsFromJson(json);
}