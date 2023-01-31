import 'package:flutter/material.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/tasks.dart';
import 'package:flutter_task_app/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeletedTasks(task: task))
        : context.read<TaskBloc>().add(RemoveTasks(task: task));
  }

  void _restoreTask(BuildContext context, Task task) {
    context.read<TaskBloc>().add(UpdatedTasks(task: task));
  }

  void _favoriteTask(BuildContext context, Task task) {
    context.read<TaskBloc>().add(FavoriteTasks(task: task));
  }

  @override
  Widget build(BuildContext context) {
    print(task.title);
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            children: [
              task.isFavourite == false
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star_sharp),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration: task.isDone == true
                              ? TextDecoration.lineThrough
                              : null,
                        )),
                    // Text(DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now())),
                    Text(DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(task.date))),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: task.isDone,
                    onChanged: task.isDeleted == false
                        ? (value) {
                            print('a');
                            context
                                .read<TaskBloc>()
                                .add(UpdatedTasks(task: task));
                          }
                        : null,
                  ),
                  PopupMenu(
                    cancelOrDeleteCallback: () {
                      print('call back');
                      _removeOrDeleteTask(context, task);
                    },
                    task: task,
                    restoreCallback: () {
                      print('retore call back');
                      _restoreTask(context, task);
                    },
                    likeOrDislike: () {
                      print('favorite call back');
                      _favoriteTask(context, task);
                    },
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
