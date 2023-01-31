import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_task_app/models/tasks.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/widgets/task_lite.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      title: SelectableText.rich(TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Text:\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: task.title,
                          ),
                          const TextSpan(
                              text: '\n\nDescription:\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: task.description,
                          ),
                        ],
                      )),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
