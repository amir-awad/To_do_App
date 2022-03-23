import 'package:flutter/cupertino.dart';

class Tasks_Data_Provider extends ChangeNotifier {
  static List<task> tasks = [
    task(
        createdtime: DateTime.now(),
        taskcategory: "business",
        name: "daily meeting with my team",
        id: 1),
    task(
        createdtime: DateTime.now(),
        taskcategory: "personal",
        name: "launch with my fiance",
        id: 2),
    task(
        createdtime: DateTime.now(),
        taskcategory: "business",
        name: "checking e-mails",
        id: 3),
    task(
        createdtime: DateTime.now(),
        taskcategory: "personal",
        name: "meditation",
        id: 4),
    task(
        createdtime: DateTime.now(),
        taskcategory: "business",
        name: "sending 1 million dollars to Tesla",
        id: 5),
  ];

  void addtask(String newtask, String newtaskcategory) {
    final _task = task(
        createdtime: DateTime.now(),
        taskcategory: newtaskcategory,
        name: newtask,
        id: 6);
    tasks.add(_task);
    notifyListeners();
  }

  updatetask(task task) {}

  deletetask(task task) {
    tasks.remove(task);
    notifyListeners();
  }
}

class task {
  DateTime createdtime;
  String taskcategory;
  String name;
  bool isfinished;
  int id;

  task({
    required this.createdtime,
    required this.taskcategory,
    required this.name,
    this.isfinished = false,
    this.id = 0,
  });
}
