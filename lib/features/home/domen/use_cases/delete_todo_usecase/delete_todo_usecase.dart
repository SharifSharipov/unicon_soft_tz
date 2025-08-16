import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicon_soft_tz/features/home/domen/repositories/todo_repositories.dart';

part 'delete_todo_usecase.freezed.dart';

class DeleteTodoUsecase extends UseCase<void, DeleteTodoParams> {
  final TodoRepository todoRepository;

  DeleteTodoUsecase(this.todoRepository);
  @override
  Future<Either<Failure, void>> call(DeleteTodoParams params) {
    return todoRepository.deleteTodo(params.id);
  }
}

@freezed
class DeleteTodoParams with _$DeleteTodoParams {
  const factory DeleteTodoParams({required int id}) = _DeleteTodoParams;
}
