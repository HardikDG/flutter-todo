import 'package:flutter/material.dart';

import './add_note.dart';
import './note_list.dart';
import '../helper/helper.dart';

import '../models/note.dart';

class UserNotes extends StatefulWidget {
  final String pageTitle;

  UserNotes({this.pageTitle});

  @override
  _UserNotesState createState() => _UserNotesState(pageTitle: this.pageTitle);
}

class _UserNotesState extends State<UserNotes> {
  List<Note> _userNotes = [];
  final String pageTitle;

  _UserNotesState({this.pageTitle});

  void _addNotes(String title, String description) {
    int id = 1;
    if (_userNotes.length > 0) {
      id = int.parse(_userNotes.last.id) + 1;
    }

    final newNote = Note(
        id: '$id',
        title: title,
        description: description,
        createdAt: DateTime.now());

    setState(() {
      _userNotes.add(newNote);
    });
  }

  // int _isIdExists(id) {
  //   int ind = _userNotes.indexWhere((note) {
  //     return note.id == id;
  //   });
  //   print('result $ind');
  //   return ind;
  // }

  Future _deleteNote(int index, bool isConfirmation) async {
    if (isConfirmation) {
      final ConfirmAction action = await asyncConfirmation(
          context: context,
          tite: 'Delete',
          content: 'Are you sure to delete?',
          successText: 'Delete');
      if (action == ConfirmAction.ACCEPT) {
        setState(() {
          _userNotes.removeAt(index);
        });
      }
    } else {
      setState(() {
        _userNotes.removeAt(index);
      });
    }
  }

  void _completeNote(int index) {
    setState(() {
      Note currentNote = _userNotes.removeAt(index);
      currentNote.isCompleted = true;
      currentNote.id = 'C${currentNote.id}';
      _userNotes.add(currentNote);
    });
  }

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
        actions: <Widget>[FlatButton(child: Icon(Icons.more_vert), onPressed: () {},)],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 224, 224, 224),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              AddNote(
                addNote: _addNotes,
              ),
              NoteList(
                notes: _userNotes,
                deleteNote: _deleteNote,
                completeNote: _completeNote,
              )
            ],
          ),
        ),
      ),
    );
  }
}
