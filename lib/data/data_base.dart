import 'package:hive/hive.dart';

class DataBase {
  List toDoList = [];
  final _myBox = Hive.box('MyBox');

  // run this if it is first time opening this app
  void createinitialData() {
    toDoList = [
      ["Make ideas", false],
      ["Go to Gym", false],
    ];
  }

  // load the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
