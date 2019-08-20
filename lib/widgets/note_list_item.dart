import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final Function deleteNote;
  final currentIndex;

  NoteListItem({this.note, this.deleteNote, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 0,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: note.isCompleted ? Colors.brown : Color.fromARGB(255, 104, 182, 243),
          child: Text(
            note.id,
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(note.title),
        subtitle: Text(note.description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteNote(currentIndex,true);
          },
        ),
      ),
    );
  }
}
