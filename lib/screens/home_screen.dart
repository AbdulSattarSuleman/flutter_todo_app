import 'package:flutter/material.dart';
import 'package:todo_app/screens/priority_dropdown.dart';
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
  String priority = 'Select Your Priority';

  double _iconSize = 35;

  // Functions
  // 1. Saved Todos
  savedTodos() {
    setState(() {
      tasks.add(getTask);
      taskController.clear();
      deadlineController.clear();
      statusController.clear();
    });
  }

  // 2. Edit Todos
  editTodos() {}

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
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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

                          // Priority Drop Down
                          const PriorityTodos(),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            savedTodos();
                            Navigator.pop(context);
                          },
                          child: const Text('Add')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel')),
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
            const SizedBox(
              height: 30,
            ),
            Text(
              "TODAY'S TASKS",
              style: kTitle2,
            ),
            if (tasks.isEmpty)
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                      child: Text(
                    'Todos List is Empty',
                    style: kTitle1,
                  )))
            else
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          tileColor: const Color(0xff031956),
                          title: Text(
                            'Todo: ${tasks[index]}',
                            style: kTitle3,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              // "Priority ${chosenValue![index]}",
                              "Priority $chosenPriority",
                              style: kcategory,
                            ),
                          ),
                          trailing: Wrap(
                            // crossAxisAlignment: WrapCrossAlignment.start,
                            // spacing: 10,
                            // mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Edit Todos
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            title:
                                                const Text('Update Your Todo'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: [
                                                  TextFormField(
                                                    onChanged: (value) {
                                                      getTask = value;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Update todo"),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        statusController,
                                                    onChanged: (value) {
                                                      getTask = value;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Update Priority"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              // Update Todo
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      tasks.replaceRange(index,
                                                          index + 1, {getTask});
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Update')),
                                              // Update -> Cancel
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Text('Cancel')),
                                            ],
                                          );
                                        });
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: _iconSize,
                                ),
                              ),
                              // Delete Todos
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Are you Sure'),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      tasks.removeAt(index);
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Text('Yes')),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('No'))
                                            ],
                                          );
                                        });
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: _iconSize,
                                ),
                              ),
                            ],
                          ),
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
