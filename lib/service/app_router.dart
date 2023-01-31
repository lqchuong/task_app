import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/favourite_tasks_screen.dart';
import 'package:flutter_task_app/screens/recycle_screen.dart';
import 'package:flutter_task_app/screens/pengding_tasks_screen.dart';
import 'package:flutter_task_app/screens/tabs_screen.dart';
import 'package:flutter_task_app/screens/test_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      case FavouriteTasksScreen.id:
        return MaterialPageRoute(builder: (_) => FavouriteTasksScreen());
      case TestScreen.id:
        return MaterialPageRoute(builder: (_) => TestScreen());
      default:
        return null;
    }
  }
}
