part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTasks extends TaskEvent {
  final Task task;
  AddTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdatedTasks extends TaskEvent {
  final Task task;
  const UpdatedTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTasks extends TaskEvent {
  final Task task;
  const RemoveTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class DeletedTasks extends TaskEvent {
  final Task task;
  const DeletedTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class FavoriteTasks extends TaskEvent {
  final Task task;
  const FavoriteTasks({required this.task});

  @override
  List<Object> get props => [task];
}
