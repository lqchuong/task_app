import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/add_task_screen.dart';
import 'package:flutter_task_app/screens/completed_tasks_screen.dart';
import 'package:flutter_task_app/screens/favourite_tasks_screen.dart';
import 'package:flutter_task_app/screens/my_drawer.dart';
import 'package:flutter_task_app/screens/pengding_tasks_screen.dart';
import 'package:flutter_task_app/screens/test_screen.dart';
import 'package:flutter_task_app/widgets/shaking_view.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetail = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const FavouriteTasksScreen(), 'title': 'Favourite Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const TestScreen(), 'title': 'Test Tasks'},
  ];

  var _selectPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true, //full screen
        anchorPoint: Offset(0, 100),
        context: context,
        builder: (context) => AddTaskScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShakeWidget(
            child: Text('${_pageDetail[_selectPageIndex]['title']}')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetail[_selectPageIndex]['pageName'],
      floatingActionButton: _selectPageIndex == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () => _addTask(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () => _addTask(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          currentIndex: _selectPageIndex,
          onTap: (index) {
            setState(() {
              _selectPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pending),
              label: 'Pending',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Test'),
          ]),
    );
  }
}
