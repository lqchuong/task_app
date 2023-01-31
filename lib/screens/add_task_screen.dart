import 'package:flutter/material.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/tasks.dart';
import 'package:flutter_task_app/service/guid_gen.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 40),
        // height: 1300,
        // padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Add task',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: descriptionController,
              maxLines: 5,
              minLines: 3,
              decoration: InputDecoration(
                  label: Text('Description'), border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('cancel')),
                ElevatedButton(
                    onPressed: () {
                      var task = Task(
                        date: DateTime.now().toString(),
                        description: descriptionController.text,
                        title: titleController.text,
                        id: GUIDGen.generate(),
                      );
                      context.read<TaskBloc>().add(AddTasks(task: task));
                      Navigator.pop(context);
                    },
                    child: Text('Add')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
