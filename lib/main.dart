import 'package:flutter/material.dart';
import 'package:flutter_to_do/home_scree/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter engine is initialized
  await Hive.initFlutter(); // Await Hive initialization

  await Hive.openBox(
      'MyBox'); // Await the box opening, no need to store it in a variable
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(), // Mark HomeScreen as const
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
