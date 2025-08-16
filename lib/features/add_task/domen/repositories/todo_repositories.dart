import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';

abstract class AddTodoRepositories {
  Future<Either<Failure, int>> add(TodoModel model);
}