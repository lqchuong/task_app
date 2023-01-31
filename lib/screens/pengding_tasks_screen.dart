import 'package:flutter/material.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/tasks.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'pending_tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed',
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
