import 'package:flutter/material.dart';
import './info_header.dart';
import '../models/note.dart';

class AddNote extends StatelessWidget {
  final _descrFocusNode = FocusNode();
  final Function addNote;
  final _formKey = GlobalKey<FormState>();
  final Note _currentNote =
      Note(id: '0', title: '', description: '', createdAt: DateTime.now());

  AddNote({this.addNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: InfoHeader(
                    title: 'Add note',
                    textColor: Color.fromARGB(255, 117, 117, 117))),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(color: Colors.black)),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descrFocusNode);
                      },
                      onSaved: (value) => _currentNote.title = value,
                      validator: (value) =>
                          value.length > 0 ? null : 'Please enter title',
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                        // keyboardType: TextInputType.multiline,
                        // maxLines: 3,
                        focusNode: _descrFocusNode,
                        decoration: InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(color: Colors.black)),
                        validator: (value) => value.length > 0
                            ? null
                            : 'Please enter description',
                        onSaved: (value) => _currentNote.description = value),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topRight,
              child: RaisedButton(
                child: Text('Add'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    addNote(_currentNote.title, _currentNote.description);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
