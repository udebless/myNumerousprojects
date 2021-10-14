import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myprojects/board_firestore/ui/custom_card.dart';

class BoardApp extends StatefulWidget {
  const BoardApp({Key key}) : super(key: key);

  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  var firestoreDb = FirebaseFirestore.instance.collection('board').snapshots();
  TextEditingController descriptionController;
  TextEditingController titleController;
  TextEditingController nameController;
  @override
  initState() {
    super.initState();
    nameController = TextEditingController();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Board'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Icon(FontAwesomeIcons.pen),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestoreDb,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, int index) {
                    return CustomCard(
                      data: snapshot.data.docs[index].data(),
                    );
                    //Text(snapshot.data.docs[index]['description']);
                  });
          }),
    );
  }

  _showDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            content: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "Name"),
                    autocorrect: true,
                    autofocus: true,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Title"),
                    autocorrect: true,
                    autofocus: true,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: "Description"),
                    autocorrect: true,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    nameController.clear();
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        titleController.text.isNotEmpty) {
                      FirebaseFirestore.instance.collection('board').add({
                        'name': nameController.text,
                        'title': titleController.text,
                        'description': descriptionController.text,
                        'timeStamp': new DateTime.now(),
                      }).then((response) => {
                            print(response.id),
                            nameController.clear(),
                            titleController.clear(),
                            descriptionController.clear(),
                            Navigator.pop(context)
                          });
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Save'))
            ],
          );
        });
  }
}
