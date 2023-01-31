import 'package:flutter/material.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/tasks.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

class FavouriteTasksScreen extends StatelessWidget {
  const FavouriteTasksScreen({Key? key}) : super(key: key);
  static const id = 'favorite_tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.favouriteTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${tasksList.length} Tasks',
                  ),
                ),
              ),
              TaskList(taskList: tasksList),
            ],
          ),
        );
      },
    );
  }
}
