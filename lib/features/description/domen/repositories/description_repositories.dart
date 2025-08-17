import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';

abstract class DescriptionRepositories {
    Future<Either<Failure, int>> edit({required int id, required TodoModel todoModel});
}