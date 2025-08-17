part of 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final localDb = sl<LocalDataBase>();
final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      builder: (_, __) =>
          BlocProvider(create: (context) => sl<HomeBloc>(), child: HomePage()),
    ),
    GoRoute(
      path: Routes.description,
      name: Routes.description,
      builder: (context, state) {
        final todo = state.extra as TodoEntity;
        return DescriptionPage(todo: todo);
      },
    ),
    GoRoute(
      path: Routes.addTask,
      name: Routes.addTask,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<AddTodoBloc>(),
        child: AddTaskPage(),
      ),
    ),
    GoRoute(
      path: Routes.editTask,
      name: Routes.editTask,
      builder: (context, state) {
        final todo = state.extra as TodoModel;
        return BlocProvider(
          create: (context) => sl<EditBloc>(),
          child: EditPage(todoModel: todo),
        );
      },
    ),
  ],
);
