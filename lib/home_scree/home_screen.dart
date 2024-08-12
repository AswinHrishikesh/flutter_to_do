import 'package:flutter/material.dart';
import 'package:flutter_to_do/constants/color_constants.dart';
import 'package:flutter_to_do/data/data_base.dart';
import 'package:flutter_to_do/utils/alert_dialog_box.dart';
import 'package:flutter_to_do/utils/to_do.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box _myBox; // Declare the Hive box variable
  DataBase db = DataBase();

  @override
  void initState() {
    super.initState();
    openBox(); // Initialize the box in a separate function
  }

  Future<void> openBox() async {
    _myBox = await Hive.openBox('MyBox'); // Await the box opening
    if (_myBox.get("TODOLIST") == null) {
      db.createinitialData();
    } else {
      // Data already exists
      db.loadData();
    }
    setState(() {}); // Update the state after loading data
  }

  // Text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialogBox(
            controller: _controller,
            onsave: saveNewTask,
            cancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.green,
      appBar: AppBar(
        title: const Center(child: Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Centers the FAB at the bottom
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, // Make the BottomAppBar transparent
        child: Container(height: 50.0), // Provide space for the FAB
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDo(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
