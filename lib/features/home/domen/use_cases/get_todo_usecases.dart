import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';
import 'package:unicon_soft_tz/core/usecase/usecase.dart';
import 'package:unicon_soft_tz/features/home/domen/entity/todo_entity.dart';
import 'package:unicon_soft_tz/features/home/domen/repositories/todo_repositories.dart';

class GetTodoUsecases extends UseCase<List<TodoEntity>, NoParams>{
  final  TodoRepository  todoRepository;
  GetTodoUsecases(this.todoRepository);
  @override
  Future<Either<Failure, List<TodoEntity>>> call(NoParams params) async{
     return await todoRepository.getTodos();
  }
}