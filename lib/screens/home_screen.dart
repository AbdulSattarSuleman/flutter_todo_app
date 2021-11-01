import 'package:flutter/material.dart';
import 'package:todo_app/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  List tasks = [];
  String getTask = '';
  String getDeadline = '';
  String getStatus = '';

  savedTodos() {
    setState(() {
      tasks.add(getTask);
      taskController.clear();
      deadlineController.clear();
      statusController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                // barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    // backgroundColor: Colors.blue,
                    title: const Text('Add Todo task'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          TextField(
                            controller: taskController,
                            onChanged: (value) {
                              getTask = value;
                            },
                            decoration:
                                const InputDecoration(hintText: 'Enter Task'),
                          ),
                          TextField(
                            controller: deadlineController,
                            onChanged: (value) {
                              getDeadline = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Deadline',
                            ),
                          ),
                          TextField(
                            controller: statusController,
                            onChanged: (value) {
                              getStatus = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Status',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            savedTodos();
                            Navigator.pop(context);
                          },
                          child: const Text('Confirm'))
                    ],
                  );
                });
          }),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "What's up, Abdul Sattar",
              style: kHeading,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "TODAY'S TASKS",
              style: kTitle2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: StadiumBorder(),
                      tileColor: const Color(0xff031956),
                      title: Text(
                        tasks[index],
                        style: kTitle1,
                      ),
                      trailing: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 10,
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
