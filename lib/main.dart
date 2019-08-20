import 'package:flutter/material.dart';

import './widgets/user_notes.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
            primarySwatch: Colors.blue, secondaryHeaderColor: Colors.black),
      home: UserNotes(pageTitle: 'Notes',),
    );
  }
}

