import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/homepage.dart';

import './providers/task.dart';

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          //    accentColor: Colors.yellow[700],
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                titleMedium: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(),
        ),
        title: 'Task List',
        home: Homepage(),
      ),
    );
  }
}
