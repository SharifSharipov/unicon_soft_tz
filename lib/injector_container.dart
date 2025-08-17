part of 'injector_container_path.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final db = LocalDataBase.instance;
  await db.warmUp();
  sl.registerSingleton<LocalDataBase>(db);
  sl.registerLazySingleton<UiControlBridge>(() => UiControlBridge());
  sl.registerLazySingleton<BackgroundService>(() => BackgroundService());
  await sl.allReady();
  repository();
  usecase();
  stateManagement();
}

///[repository]
void repository() {
  sl.registerLazySingleton<AddTodoRepositories>(
    () => AddTodoRepositoriesImpl(sl()),
  );
  sl.registerLazySingleton<TodoRepositories>(() => TodoRepositoriesImpl(sl()));
  sl.registerLazySingleton<DescriptionRepositories>(
    () => DescriptionRepositoriesImpl(sl()),
  );
}

///[usecase]
void usecase() {
  sl.registerLazySingleton<TodoUseCase>(() => TodoUseCase(sl()));
  sl.registerLazySingleton<GetTodoUsecases>(() => GetTodoUsecases(sl()));
  sl.registerLazySingleton<DeleteTodoUsecase>(() => DeleteTodoUsecase(sl()));
  sl.registerLazySingleton<EditTodoUseCase>(() => EditTodoUseCase(sl()));
  sl.registerLazySingleton<EditCompletedUseCase>(() => EditCompletedUseCase(sl()));
}

///[bloc]
void stateManagement() {
  sl.registerFactory<AddTodoBloc>(() => AddTodoBloc(sl(),sl()));
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl(), sl(),sl()));
  sl.registerFactory<EditBloc>(() => EditBloc(sl()));
}
