import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/data_source/local_data_base.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/add_task/domen/repositories/todo_repositories.dart';


class TodoRepositoriesImpl implements TodoRepositories {
  final LocalDataBase localDb;
  TodoRepositoriesImpl( this.localDb);
  @override
Future<Either<Failure, int>> add(TodoModel model) async {
    try {
      final response = await localDb.insertTodo(model);
      return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
