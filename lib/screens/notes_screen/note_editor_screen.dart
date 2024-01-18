import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:study_buddy/constants/app_colors.dart';
import 'package:study_buddy/provider/database_provider.dart';
import 'package:study_buddy/screens/notes_screen/format.dart';
import 'package:study_buddy/screens/notes_screen/notes_screen.dart';
import 'package:study_buddy/screens/session_screen/utils/session_utils.dart';
import 'dart:developer' as devtools show log;

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});
  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  DatabaseProvider db = DatabaseProvider();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainContentController = TextEditingController();
  String date = DateFormat(dateFormat).format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor:  Colors.purple,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add a new note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
                controller: _titleController,
                style: GoogleFonts.roboto(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                date,
                style: dateTitle,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _mainContentController,
                  style: mainContent,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a note',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await db
              .addNote(
            title: _titleController.text,
            content: _mainContentController.text,
            isPinned: false,
          )
              .then((value) {
            Get.off(() => const NotesScreen());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Note saved successfully"),
              showCloseIcon: true,
              backgroundColor: Color.fromARGB(255, 54, 145, 57),
              closeIconColor: Colors.black,
              duration: Duration(seconds: 1),
            ));
          });
        },
        child: const Icon(Icons.save_as_rounded),
      ),
    );
  }
}
