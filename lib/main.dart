import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/tasks_data_provider.dart';

import 'ToDo_App.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => Tasks_Data_Provider(),
      child: const MaterialApp(
        home: ToDo_App(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
