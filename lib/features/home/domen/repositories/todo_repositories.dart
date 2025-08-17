import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';

abstract class TodoRepositories {
  Future<Either<Failure, List<TodoEntity>>> getTodos();
  Future<Either<Failure, void>> deleteTodo(int id);
}
