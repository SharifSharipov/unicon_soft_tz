part of 'injector_container_path.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final db = LocalDataBase.instance;
  await db.warmUp();
  sl.registerSingleton<LocalDataBase>(db);
  await sl.allReady();
  repository();
  usecase();
  stateManagement();
}

///[repository]
void repository() {
  sl.registerLazySingleton<TodoRepositories>(() => TodoRepositoriesImpl(sl()));
}
///[usecase]
void usecase() {
  sl.registerLazySingleton<TodoUseCase>(() => TodoUseCase(sl()));
}
///[bloc]
void stateManagement() {
  sl.registerFactory<AddTodoBloc>(() => AddTodoBloc(sl()));
}
