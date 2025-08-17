import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon_soft_tz/core/colors/app_colors.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/home/presentation/bloc/home_bloc.dart';
import 'package:unicon_soft_tz/features/home/presentation/pages/home_mixn.dart';
import 'package:unicon_soft_tz/features/home/presentation/widgets/home_body_widget.dart';
import 'package:unicon_soft_tz/features/home/presentation/widgets/task_type_widget.dart';
import 'package:unicon_soft_tz/router/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixn {

  @override
  
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          
          return RefreshIndicator(
            displacement: 0,
            edgeOffset: 0,
            color: AppColors.primary,
            backgroundColor: const Color.fromARGB(255, 211, 218, 227),
            onRefresh: () async {
              context.read<HomeBloc>().add(GetTodEvent());
            },

            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Home page', style: context.textStyle.appBarTitle),
                centerTitle: true,
                elevation: 0,
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.addTask);
                    },
                    child: Text(
                      "add task +",
                      style: context.textStyle.bodySubheadline,
                    ),
                  ),
                ],
              ),
              backgroundColor: context.colorScheme.surface,
              body: Column(
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      TaskTypeWidget(
                        tasknName: "x=>total:",
                        taskCount: state.todos.length.toString(),
                        color: const Color.fromARGB(255, 192, 120, 19),
                      ),
                      TaskTypeWidget(
                        tasknName: "y=>done:",
                        taskCount: "${counter(state.todos)}",
                        color: const Color.fromARGB(255, 4, 254, 142),
                      ),
                      TaskTypeWidget(
                        tasknName: "z=>not done:",
                        taskCount: '${state.todos.length - counter(state.todos)}',
                        color: AppColors.red,
                      ),
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => HomeBodyWidget(
                        todo: state.todos[index],
                        onLongPress: () {
                          context.read<HomeBloc>().add(
                            TodoIsCompletedEvent(
                              state.todos[index].id,
                              TodoModel(
                                id: state.todos[index].id,
                                title: state.todos[index].title,
                                description: state.todos[index].description,
                                startTime: state.todos[index].startTime,
                                isCompleted: 1,
                              ),
                            ),
                          );
                          context.read<HomeBloc>().add(GetTodEvent());
                        },
                        onTap: () {
                          context.pushNamed(
                            Routes.description,
                            extra: state.todos[index],
                          );
                        },
                      ),
                      itemCount: state.todos.length,
                    ).paddingOnly(top: 10),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          );
        },
      ),
    );
  }
}
