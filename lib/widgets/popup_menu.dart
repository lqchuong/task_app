import 'package:flutter/material.dart';
import 'package:flutter_task_app/models/tasks.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback restoreCallback;
  final VoidCallback likeOrDislike;
  final Task task;
  const PopupMenu(
      {super.key,
      required this.cancelOrDeleteCallback,
      required this.task,
      required this.restoreCallback,
      required this.likeOrDislike});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text('edit'),
                      ),
                      onTap: () {}),
                  PopupMenuItem(
                      onTap: likeOrDislike,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: task.isFavourite == false
                              ? const Icon(Icons.bookmark_add_outlined)
                              : const Icon(Icons.bookmark_remove),
                          label: task.isFavourite == false
                              ? const Text('Add to BookMarks')
                              : const Text('Remove from BookMarks'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'))),
                ])
            : (context) => [
                  PopupMenuItem(
                      onTap: restoreCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever),
                          label: const Text('Delete Forever'))),
                ]);
  }
}
