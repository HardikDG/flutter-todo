import 'package:flutter/foundation.dart';

class Note {
  String id;
  String title;
  String description;
  DateTime createdAt;
  bool isCompleted;

  Note(
      {
        @required this.id,
        @required this.title,
        @required this.description,
        this.isCompleted = false,
        this.createdAt
      });
}
