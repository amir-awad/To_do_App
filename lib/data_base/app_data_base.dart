import 'package:sqflite/sqflite.dart';
import 'Data_modules.dart';
import 'package:todo_app/provider/tasks_data_provider.dart';

final Provider = Tasks_Data_Provider();

class LocalDatabase {
  static late Database database;

  static List<Tasks_Data> data = [];

  static Future<void> createDatabase() async {
    database = await openDatabase('test1.db', version: 1,
        onCreate: (database, version) async {
      print('database is created!');

      await database
          .execute(
              'create table tasks_data (id integer primary key autoincrement, task_name text ,taskcateogry text , isfinished bool , createdtime DateTime , favouritTasks text)'
              'create table user_data (id integer primary key, name text , email text , age int )')
          .then((value) => print("tables are created !"));
    }).catchError((error) {
      print(error.toString());
    });
  }
  //_____________________________________________________________________

  static Future<void> insertintoDatabase(Tasks_Data data) async {
    database
        .rawInsert(
            'insert into tasks_data (name,taskcateogry,createdtime,isfinished) values (?,?,?,?)',
            [data.name, data.taskcategory, data.createdtime, data.isfinished])
        .then((value) => print('${value} is inserted successfully '))
        .catchError((error) {
          print(error.toString());
        });
  }
  //_____________________________________________________________________

  static void getData(Database database) {
    database
        .rawQuery('select * from tasks_data'
            'select * from user_data ')
        .then((value) => value.forEach((element) {
              data.add(Tasks_Data(
                  createdtime: element['createdtime'] as DateTime,
                  taskcategory: element['taskcateogry'] as String,
                  name: element['name'] as String));
            }))
        .catchError((error) {
      print(error.toString());
    });
  }
  //______________________________________________________________________

  static void updateDatabase(Tasks_Data data) {
    database
        .rawUpdate(
            'update tasks_data set taskcateogry = ? , isfinished = ? , name = ? where id = ?',
            [data.taskcategory, data.isfinished, data.name, data.id])
        .then((value) => print('record $value is updates successfully'))
        .catchError((error) {
          print(error.toString());
        });
  }
  //_______________________________________________________________________

  static void deleteDatabase(int id) {
    database
        .rawDelete('delete from tasks_data where id = ?', [id])
        .then((value) => print('record $value is deleted successfully'))
        .catchError((error) {
          print(error.toString());
        });
  }

  // addnewtask(task newtask ) async {
  //   final db = await database;
  //   db.insert('tasks', , conflictAlgorithm: ConflictAlgorithm.replace);
  // }
}
