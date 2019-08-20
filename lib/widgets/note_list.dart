import 'package:flutter/material.dart';

import './info_header.dart';
import './note_list_item.dart';
import '../helper/helper.dart';

import '../models/note.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  final Function deleteNote;
  final Function completeNote;

  NoteList({this.notes, this.deleteNote, this.completeNote});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InfoHeader(
                title: 'Note List',
                textColor: Color.fromARGB(255, 103, 103, 103)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              height: 400,
              child: notes.length > 0
                  ? ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          background: Container(color: Colors.red),
                          child: NoteListItem(
                              currentIndex: index,
                              note: notes[index],
                              deleteNote: deleteNote),
                          key: Key(notes[index].id),
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd &&
                                notes[index].isCompleted) {
                              return false;
                            } else if (direction == DismissDirection.endToStart) {
                              final ConfirmAction action =
                                  await asyncConfirmation(
                                      context: context,
                                      tite: 'Delete',
                                      content: 'Are you sure to delete?',
                                      successText: 'Delete');
                              if (action == ConfirmAction.ACCEPT) {
                                return true;
                              } else {
                                return false;
                              }
                            } else {
                              return true;
                            }
                          },
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "${notes[index].title} Note Deleted")));
                              deleteNote(index, false);
                            } else {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "${notes[index].title} Note is completed")));
                              completeNote(index);
                            }
                          },
                        );
                      },
                      itemCount: notes.length,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InfoHeader(
                            title: 'No notes found',
                            textColor: Color.fromARGB(255, 103, 103, 103))
                      ],
                    ),
            ),
          ],
        ));
  }
}
