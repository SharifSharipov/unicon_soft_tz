import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/data_source/local_data_base.dart' show LocalDataBase;
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/features/home/domen/repositories/todo_repositories.dart';


class TodoRepositoryImpl implements TodoRepository {
  final LocalDataBase localDb;
  TodoRepositoryImpl(this.localDb);

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    try {
      final models = await localDb.getTodos();
      final entities = models.map((m) => TodoEntity(
        id: m.id ?? 0,
        title: m.title,
        description: m.description,
        startTime: m.startTime,
        isCompleted: m.isCompleted == 1,
      )).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(int id) async {
    try {
      await localDb.deleteById(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
