import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/description/domen/repositories/description_repositories.dart';

part 'edit_complated_usce_case.freezed.dart';
part 'edit_complated_usce_case.g.dart';

class EditCompletedUseCase extends UseCase<int, EditCompletedParams> {
  final DescriptionRepositories _repository;

  EditCompletedUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(EditCompletedParams params) async {
    return _repository.edit(id: params.id, todoModel: params.todoModel);
  }
}

@freezed
class EditCompletedParams with _$EditCompletedParams {
  const factory EditCompletedParams({
    required int id,
    required TodoModel todoModel,
  }) = _EditCompletedParams;

  factory EditCompletedParams.fromJson(Map<String, dynamic> json) =>
      _$EditCompletedParamsFromJson(json);
}
