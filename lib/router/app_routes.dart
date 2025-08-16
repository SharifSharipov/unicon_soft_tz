part of 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final localDb = sl<LocalDataBase>();
final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.description,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      builder: (_, __) => HomePage(),
    ),
    GoRoute(
      path: Routes.description,
      name: Routes.description,
      builder: (_, __) => DescriptionPage(),
    ),
    GoRoute(
      path: Routes.addTask,
      name: Routes.addTask,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<AddTodoBloc>(),
        child: AddTaskPage(),
      ),
    ),
  ],
);
