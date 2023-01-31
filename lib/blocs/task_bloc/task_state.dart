part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;
  final List<Task> removeTasks;
  const TaskState(
      {this.completedTasks = const <Task>[],
      this.favouriteTasks = const <Task>[],
      this.pendingTasks = const <Task>[],
      this.removeTasks = const <Task>[]});

  @override
  List<Object> get props => [pendingTasks, removeTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'removeTasks': removeTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favouriteTasks': favouriteTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
      removeTasks: List<Task>.from(
        (map['removeTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
      favouriteTasks: List<Task>.from(
        (map['favouriteTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
    );
  }
}
