import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/navigation_drawer.dart';
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
                    'add your task 👇',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  titlePadding: const EdgeInsets.fromLTRB(4, 5, 4, 10),
                  content: SizedBox(
                    height: 183,
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
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Tasks_Data_Provider().addtask(
                                    _taskdescription.text, _taskcateogry.text);
                                print('task added sucessfully');
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
              Text(
                "CATEGORIES",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
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
                                color: Colors.brown[500],
                                height: 3,
                                width: 100,
                              ),
                              // flex: (percentagedone ?? 1),
                            ),
                            Expanded(
                              // flex: 100 - (percentage ?? 1),
                              child: Container(
                                color: Colors.brown[500],
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
              Text("TODAY'S TASKS",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  )),
            ],
          ),
          //----------------------------------------------
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Tasks_Data_Provider.tasks.length,
                itemBuilder: (context, index) {
                  task item = Tasks_Data_Provider.tasks[index];
                  return Slidable(
                    key: Key(Tasks_Data_Provider.tasks[index].name),
                    startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            onPressed: Tasks_Data_Provider()
                                .deletetask(Tasks_Data_Provider.tasks[index]),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            label: 'delete',
                            icon: Icons.delete,
                          ),
                          SlidableAction(
                              onPressed: Tasks_Data_Provider()
                                  .updatetask(Tasks_Data_Provider.tasks[index]),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              label: 'edit',
                              icon: Icons.edit)
                        ]),
                    child: buildListTile(item),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(task item) {
    return ListTile(
      contentPadding: const EdgeInsets.all(12),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.circle_outlined,
            color: Colors.deepOrangeAccent,
          )),
      onTap: () {},
      title: Text(
        item.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
