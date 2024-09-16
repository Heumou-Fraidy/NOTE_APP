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

  @override
  void iniitState(){
    // todo implement 
    super.initState();
    //on app startup
    readNotes();
  }

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
            //clear control
            textController.clear();


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
  void updateNote(Note note) {

    //pre fill the current note
    textController.text = note.text;
    showDialog(context: context,
     builder:(context) => AlertDialog(
      title: Text("Update Note"),
      content: TextField(controller: textController),
      actions: [
        // update button
        MaterialButton(onPressed: () {
          //update note in db
          context
          .read<NoteDatabase>()
          .updateNotes(note.id, textController.text);
          // clear controller
          textController.clear();

          //pop dialog
          Navigator.pop(context);

        },
        child: const Text("Update"),
        )
      ]
     ),
      );
  }

  // delete notes
void deleteNote(int id){
  context.read<NoteDatabase>().deleteNote(id);
}

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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // edit button
                IconButton(
                  onPressed: () => updateNote(note),
                  icon: const Icon(Icons.edit),
                ),

                // delete button
                IconButton(
                  onPressed: () => deleteNote(note.id),
                  icon: const Icon(Icons.delete),
                ),
              ]
            ),
          );
    },
    ),
    );
  }
}
