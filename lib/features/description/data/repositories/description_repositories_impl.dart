import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/features/add_task/data/data_source/local_data_base.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/description/domen/repositories/description_repositories.dart';

class DescriptionRepositoriesImpl implements DescriptionRepositories {
  final LocalDataBase localDb;
  DescriptionRepositoriesImpl(this.localDb);
  @override
  Future<Either<Failure, int>> edit({required int id, required TodoModel todoModel}) async {
       try {
      final response = await localDb.edit(id: id, todoModel: todoModel);
      return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
