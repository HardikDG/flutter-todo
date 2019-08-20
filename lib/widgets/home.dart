import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import './user_notes.dart';

class Home extends StatelessWidget {
  final String pageTitle;

  Home({this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 224, 224, 224),
          width: double.infinity,
          child: UserNotes(),
        ),
      ),
    );
  }
}
