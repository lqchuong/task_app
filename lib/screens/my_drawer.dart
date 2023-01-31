import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/recycle_screen.dart';
import 'package:flutter_task_app/screens/tabs_screen.dart';
import 'package:flutter_task_app/screens/pengding_tasks_screen.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    title: const Text('Task'),
                    subtitle: const Text('........'),
                    leading: const Icon(Icons.folder),
                    trailing: Text(
                      '${state.pendingTasks.length} | ${state.completedTasks.length}',
                    ),
                  ),
                );
              },
            ),
            // const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    title: const Text('Recycle Bin'),
                    leading: const Icon(Icons.delete),
                    trailing: Text(
                      '${state.removeTasks.length}',
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (value) {
                      value
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
