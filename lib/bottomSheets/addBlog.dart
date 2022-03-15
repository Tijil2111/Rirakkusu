// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:reduceo/shared/constants.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final tagController = TextEditingController();
  final linkController = TextEditingController();

  Future addData() async {
    await FirebaseFirestore.instance.collection('stories').add(
      {
        'name': nameController.text.trim(),
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'tags': tagController.text.trim(),
        'links': linkController.text.trim(),
      },
    ).then(
      (value) => print('Blog Added !'),
    );
  }

  void dispose() {
    titleController.dispose();
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            ClipRRect(
              child: Image(
                image: AssetImage('assets/wave.png'),
                color: HexColor("#80E7FA"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 130.0),
              child: Text("Lets Add A New Story",
                  style: TextStyle(
                    color: HexColor("#80E7FA"),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 185.0),
              child: Text("Enter Some Info Below",
                  style: TextStyle(
                    color: HexColor("#80E7FA"),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                controller: titleController,
                style: TextStyle(color: HexColor("#80E7FA")),
                cursorColor: HexColor("#80E7FA"),
                textInputAction: TextInputAction.next,
                decoration: textInputDecoration.copyWith(hintText: 'Title'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(color: HexColor("#80E7FA")),
                cursorColor: HexColor("#80E7FA"),
                textInputAction: TextInputAction.next,
                decoration: textInputDecoration.copyWith(hintText: 'Your Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: tagController,
                style: TextStyle(color: HexColor("#80E7FA")),
                cursorColor: HexColor("#80E7FA"),
                textInputAction: TextInputAction.next,
                decoration: textInputDecoration.copyWith(
                    hintText: 'Tags (If none type none)'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: tagController,
                style: TextStyle(color: HexColor("#80E7FA")),
                cursorColor: HexColor("#80E7FA"),
                textInputAction: TextInputAction.next,
                decoration: textInputDecoration.copyWith(
                    hintText: 'Links (If none type none)'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: descriptionController,
                style: TextStyle(color: HexColor("#80E7FA")),
                cursorColor: HexColor("#80E7FA"),
                textInputAction: TextInputAction.next,
                decoration:
                    textInputDecoration.copyWith(hintText: 'The Blog Itself !'),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.personBooth),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added 🥳'),
                    backgroundColor: Colors.green,
                  ),
                );
                addData();
              },
              label: const Text('Add It !'),
              style: ElevatedButton.styleFrom(
                primary: HexColor("#80E7FA"),
                minimumSize: const Size(300, 50),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        )),
      ),
    );
  }
}
