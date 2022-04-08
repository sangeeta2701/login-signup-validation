import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_intershala/screens/dashboard.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  XFile? _imageFile;

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  Future pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  Future getImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = image;
    });
  }

  late SharedPreferences s_prfs;
  late String temp;
  _addNewNotes() async {
    s_prfs = await SharedPreferences.getInstance();
    s_prfs.setString("image", _imageFile!.path);
  }

  final notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Add new notes"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _fromkey,
              child: Column(
                children: [
                  Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                          )),
                      child: _imageFile == null
                          ? Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Image is not loaded",
                                style: TextStyle(fontSize: 25),
                              ),
                            )
                          : Image(image: FileImage(File(_imageFile!.path)))
                      //Image.asset(_imageFile!),
                      ),
                  TextFormField(
                    // controller: notesController,
                    decoration: InputDecoration(labelText: "Title"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your title";
                      }
                      if (value.length < 5) {
                        return "Title should be at-least 5 characters";
                      }
                      if (value.length > 100) {
                        return "Title should be less than 100 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    // controller: notesController,
                    decoration: InputDecoration(labelText: "Description"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your description";
                      }
                      if (value.length < 100) {
                        return "description should be at-least 100 characters";
                      }
                      if (value.length > 1000) {
                        return "description should be less than 1000 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: getImage,
                        icon: Icon(Icons.camera_alt),
                        iconSize: 45,
                        color: Colors.cyan,
                      ),
                      IconButton(
                        onPressed: pickImage,
                        icon: Icon(Icons.collections_rounded),
                        iconSize: 45,
                        color: Colors.cyan,
                      ),
                    ],
                  ),
                  OutlineButton(
                      color: Colors.black12,
                      onPressed: () {
                        if (_fromkey.currentState!.validate()) {
                          _addNewNotes();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()));
                          /*
                         * img =   fileurl
                         * setInt("image1", img)
                         * getInt("image1)
                         * */
                        } else {
                          print("Unsuccessful");
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> setNotesData(noteValue) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString('noteData', noteValue);
  // }
}
