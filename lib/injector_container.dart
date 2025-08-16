part of 'injector_container_path.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final db = LocalDataBase.instance;
  await db.warmUp();
  sl.registerSingleton<LocalDataBase>(db);
  sl.registerLazySingleton<UiControlBridge>(() => UiControlBridge());
  await sl.allReady();
  repository();
  usecase();
  stateManagement();
}

///[repository]
void repository() {
  sl.registerLazySingleton<AddTodoRepositories>(() => AddTodoRepositoriesImpl(sl()));
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
  
}
///[usecase]
void usecase() {
  sl.registerLazySingleton<TodoUseCase>(() => TodoUseCase(sl()));
  sl.registerLazySingleton<GetTodoUsecases>(()=>GetTodoUsecases(sl()));
  sl.registerLazySingleton<DeleteTodoUsecase>(()=>DeleteTodoUsecase(sl()));
}
///[bloc]
void stateManagement() {
  sl.registerFactory<AddTodoBloc>(() => AddTodoBloc(sl()));
  sl.registerFactory<HomeBloc>(()=>HomeBloc(sl(), sl()));
}
