import 'package:flutter/material.dart';

class Tasks_Data_Provider extends ChangeNotifier {
  final List<task> tasks = [
    task(
        createdtime: DateTime.now(),
        taskcategory: "business",
        name: "daily meeting with my team",
        id: 1,
        taskdate: 'Apr 18, 2022',
        isfavourit: true),
    task(
        createdtime: DateTime.now(),
        taskcategory: "personal",
        name: "launch with my fiance",
        id: 2,
        taskdate: 'Apr 17, 2022',
        isfavourit: true),
    task(
        createdtime: DateTime.now(),
        taskcategory: "personal",
        name: "meditation",
        id: 3,
        taskdate: 'Apr 5, 2022',
        isfavourit: false),
    task(
        createdtime: DateTime.now(),
        taskcategory: "business",
        name: "sending 1 million dollars to Tesla",
        id: 4,
        taskdate: 'Apr 28, 2022',
        isfavourit: false),
    task(
        createdtime: DateTime.now(),
        taskcategory: "business",
        name: "gettin the deal with Ubisoft Inc",
        id: 5,
        taskdate: 'MAY 20, 2022',
        isfavourit: true),
    task(
        createdtime: DateTime.now(),
        taskcategory: "personal",
        name: "reading Atomic habits book",
        id: 6,
        taskdate: 'MAY 16, 2022',
        isfavourit: true),
  ];

  void addtask(String newtask, String newtaskcategory, String date) {
    final _task = task(
      createdtime: DateTime.now(),
      taskcategory: newtaskcategory,
      name: newtask,
      id: 8, //keep tracking of the last id entered and (++) to add a new id to the new task
      taskdate: date,
      isfinished:
          false, //getting the taskdate entered by the userin that fucking format!
    );

    notifyListeners();
  }

  updatetask(task task) {}

  deletetask(task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void chnageiconcolor(task task) {
    if (task.isfavourit == true) {
      const Icon(Icons.favorite, color: Colors.deepOrangeAccent);
    } else if (task.isfavourit == false) {
      const Icon(Icons.favorite_outline_outlined);
    }
  }
}

class task {
  DateTime createdtime;
  String taskcategory;
  String name;
  bool isfinished;
  int id;
  String taskdate;
  bool isfavourit;

  task({
    required this.createdtime,
    required this.taskcategory,
    required this.name,
    this.isfinished = false,
    this.id = 0,
    required this.taskdate,
    this.isfavourit = false,
  });

  void togglefavourit() {
    isfavourit = !isfavourit;
  }
}
