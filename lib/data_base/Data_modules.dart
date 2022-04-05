class Tasks_Data {
  DateTime createdtime;
  String taskcategory;
  String name;
  bool isfinished;
  int id;
  bool isfavourit;

  Tasks_Data({
    required this.createdtime,
    required this.taskcategory,
    required this.name,
    this.isfinished = false,
    this.id = 0,
    this.isfavourit = false,
  });
}
