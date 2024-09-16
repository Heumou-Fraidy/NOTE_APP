import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../models/note.database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //text controller for the user
  final textController = TextEditingController();

  // create a note
void createNote() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        //create button
        MaterialButton(
          onPressed: () {
            // add to db
            context.read<NoteDatabase>().addNote(textController.text);

            //pop dialog box
            Navigator.pop(context);
          },
          child: const Text("Create"),
        )
      ]
    ),
  );
}
  // read a note
void readNotes(){
  context.watch<NoteDatabase>().fetchNotes();
}
  // update notes

  // delete notes

  @override
  Widget build(BuildContext context) {

  //note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          //get individual note
          final note = currentNotes[index];

          //list title ui
          return ListTile(
            title: Text(note.text),
          );
    },
    ),
    );
  }
}
