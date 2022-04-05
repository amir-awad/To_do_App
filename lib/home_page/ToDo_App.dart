import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/drawer_widget/navigation_drawer.dart';
import 'package:todo_app/provider/tasks_data_provider.dart';

class ToDo_App extends StatefulWidget {
  const ToDo_App({Key? key}) : super(key: key);

  @override
  State<ToDo_App> createState() => _ToDo_AppState();
}

class _ToDo_AppState extends State<ToDo_App> {
  int slidervalue1 = 50;
  int slidervalue2 = 50;
  final TextEditingController _taskcateogry = TextEditingController();
  final TextEditingController _taskdescription = TextEditingController();
  final TextEditingController _taskdate = TextEditingController();

  final provider = Tasks_Data_Provider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange[800]),
        actions: [
          IconButton(
            iconSize: 28,
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: Colors.deepOrange[900],
            ),
          ),
          IconButton(
            iconSize: 28,
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.deepOrange[800],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                  backgroundColor: Colors.orange[100],
                  title: const Center(
                      child: Text(
                    'add your task ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  titlePadding: const EdgeInsets.fromLTRB(4, 5, 4, 10),
                  content: SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _taskcateogry,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.deepOrange[300],
                                fontWeight: FontWeight.bold),
                            border: const UnderlineInputBorder(),
                            labelText: "task cateogry",
                          ),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _taskdescription,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.deepOrange[300],
                                  fontWeight: FontWeight.bold),
                              border: const UnderlineInputBorder(),
                              labelText: "task description"),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                        TextFormField(
                          controller: _taskdate,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.deepOrange[300],
                                  fontWeight: FontWeight.bold),
                              border: const UnderlineInputBorder(),
                              labelText: "task date"),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Tasks_Data_Provider().addtask(
                                    _taskdescription.text,
                                    _taskcateogry.text,
                                    _taskdate.text);

                                Navigator.pop(context);
                                final snackBar = SnackBar(
                                    content: const Text(
                                      'Task saved successfully',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    action: SnackBarAction(
                                        label: 'undo', onPressed: () {}));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              child: const Text(
                                "save",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                  )));
        },
        tooltip: "add task",
        backgroundColor: Colors.deepOrange.shade300,
        child: const Icon(
          Icons.add,
        ),
      ),
      //----------------------------------------------
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              const Text(
                "What's up,",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                " Ahmed!",
                style: TextStyle(
                    color: Colors.deepOrange[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.5),
                    color: Colors.white),
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                width: 170,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5 tasks",
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "business",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular((20)),
                      child: SizedBox(
                        height: 3,
                        width: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey[900],
                                height: 3,
                                width: 100,
                              ),
                              // flex: (percentagedone ?? 1),
                            ),
                            Expanded(
                              // flex: 100 - (percentage ?? 1),
                              child: Container(
                                color: Colors.grey[900],
                                height: 3,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                width: 170,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "10 tasks",
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "personal",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular((20)),
                      child: SizedBox(
                        height: 3,
                        width: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.orange[500],
                                height: 9,
                                width: 100,
                              ),
                              // flex: (percentagedone ?? 1),
                            ),
                            Expanded(
                              // flex: 100 - (percentage ?? 1),
                              child: Container(
                                color: Colors.orange[500],
                                height: 3,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.5),
                    color: Colors.white),
                child: Text("TODAY'S TASKS",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    )),
              ),
            ],
          ),
          //----------------------------------------------
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.tasks.length,
                itemBuilder: (context, index) {
                  final task = provider.tasks[index];

                  return Slidable(
                    key: Key(provider.tasks[index].name),
                    endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                              onPressed: (index) {},
                              backgroundColor: Colors.black87,
                              foregroundColor: Colors.white,
                              label: 'edit',
                              icon: Icons.edit_sharp),
                          SlidableAction(
                            onPressed: (index) {},
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            label: 'delete',
                            icon: Icons.delete,
                          ),
                        ]),
                    child: buildListTile(task),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(task task) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.circle_outlined,
            color: task.taskcategory == 'business'
                ? Colors.grey[900]
                : Colors.deepOrangeAccent,
          ),
        ),
        onTap: () {},
        title: Text(
          task.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          task.taskdate.toString(),
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
            iconSize: 20,
            onPressed: () {
              if (task.isfavourit == true) {
                task.isfavourit == false;
                provider.chnageiconcolor(task);
              } else {
                final snackBar = SnackBar(
                    content: const Text(
                      'Task added to favourits successfully',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    action: SnackBarAction(
                        label: 'undo',
                        onPressed: () {
                          task.isfavourit = false;
                          provider.chnageiconcolor(task);
                        }));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  task.isfavourit = true;
                  provider.chnageiconcolor(task);
                });
              }
            },
            icon: task.isfavourit == true
                ? const Icon(
                    Icons.favorite,
                    color: Colors.deepOrangeAccent,
                  )
                : const Icon(Icons.favorite_outline_outlined)),
      );
}
