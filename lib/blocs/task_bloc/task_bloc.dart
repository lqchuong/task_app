import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTasks>(_onAddTask);
    on<UpdatedTasks>(_onUpdatedTask);
    on<DeletedTasks>(_onDeletedTask);
    on<RemoveTasks>(_onRemoveTask);
    on<FavoriteTasks>(_onMarkFavoriteOrUnfavoriteTask);
  }

  void _onAddTask(AddTasks event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        removeTasks: state.removeTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks));
  }

  void _onUpdatedTask(UpdatedTasks event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final index = state.pendingTasks.indexOf(task);
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> removeTasks = state.removeTasks;
    print(removeTasks);
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false))
          };
    task.isDeleted == false
        ? {}
        : {
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDeleted: false)),
            removeTasks = List.from(removeTasks)..remove(task)
          };
    emit(TaskState(
        pendingTasks: pendingTasks,
        removeTasks: removeTasks,
        completedTasks: completedTasks,
        favouriteTasks: state.favouriteTasks));
  }

  void _onRemoveTask(RemoveTasks event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    print('remove');
    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)..remove(task),
      removeTasks: List.from(state.removeTasks)
        ..add(event.task.copyWith(isDeleted: true)),
      completedTasks: List.from(state.completedTasks)..remove(task),
      favouriteTasks: List.from(state.favouriteTasks)..remove(task),
    ));
  }

  void _onDeletedTask(DeletedTasks event, Emitter<TaskState> emit) {
    final state = this.state;
    print('delete');
    emit(TaskState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removeTasks: List.from(state.removeTasks)..remove(event.task)));
  }

  void _onMarkFavoriteOrUnfavoriteTask(
      FavoriteTasks event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favouriteTasks = state.favouriteTasks;
    if (event.task.isDone == false) {
      if (event.task.isFavourite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        print(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        favouriteTasks.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        favouriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavourite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        favouriteTasks.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        favouriteTasks.remove(event.task);
      }
    }
    emit(TaskState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favouriteTasks: favouriteTasks,
        removeTasks: state.removeTasks));
  }

  @override
  TaskState fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
