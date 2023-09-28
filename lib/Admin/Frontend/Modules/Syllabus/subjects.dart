import 'package:bhimani_classes/Admin/Authentication/Fronend/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'folders.dart';

class Subjects extends StatefulWidget {
  String did1, did2;

  Subjects({
    required this.did1,
    required this.did2,
  });

  @override
  State<Subjects> createState() => _SubjectsState(did1: did1, did2: did2);
}

class _SubjectsState extends State<Subjects> {
  String did1, did2;

  _SubjectsState({
    required this.did1,
    required this.did2,
  });

  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('admin');
  TextEditingController _sectionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('admin')
        .doc(user!.uid)
        .collection('Dashboard')
        .doc(did1)
        .collection('Standard')
        .doc(did2)
        .collection('Subject')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          //menu icon button at start left of appbar
          onPressed: () {
            //code to execute when this button is pressed
          },
          icon: Icon(
            Icons.menu_outlined,
            size: 25,
            color: Color.fromRGBO(3, 54, 134, 1.0),
          ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Subjects',
          style: TextStyle(color: Color.fromRGBO(3, 54, 134, 1.0)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(
                Icons.person,
                size: 25,
                color: Color.fromRGBO(3, 54, 134, 1.0),
              ))
        ],
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Folders(
                              did1: did1,
                              did2: did2,
                              did3: document.id,
                              name: data['name'],
                            )),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              data['icon'],
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              data['name'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(3, 54, 134, 1.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Positioned(
            bottom: 30,
            // left: 0,
            right: 25,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(3, 54, 134, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () async{
                  await showSubjectDialogBox(context);
                },
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> showSubjectDialogBox(BuildContext context) async{
    TextEditingController _sectionController = new TextEditingController();
    return await showDialog(barrierDismissible: false,context: context, builder: (context){
      bool isChecked=false;
      return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          title: Text('Add Subject'),
          content: TextField(
            controller: _sectionController,
            decoration: InputDecoration(
              labelText: 'Enter Subject Name',
              labelStyle: TextStyle(
                  color: Colors.black), // Change the label text color
            ),
            style: TextStyle(
                color: Colors.blue), // Change the text color
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Create the folder
                if (_sectionController.text != '' &&
                    _sectionController.text == "Gujarati") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did1)
                      .collection('Standard')
                      .doc(did2)
                      .collection('Subject')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/Gujarati.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Maths") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did1)
                      .collection('Standard')
                      .doc(did2)
                      .collection('Subject')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/Maths.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Science") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did1)
                      .collection('Standard')
                      .doc(did2)
                      .collection('Subject')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/Science.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Social Science") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did1)
                      .collection('Standard')
                      .doc(did2)
                      .collection('Subject')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/SocialScience.png"
                  });
                }

                if (_sectionController.text != '' &&
                    _sectionController.text == "Sanskrit") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did1)
                      .collection('Standard')
                      .doc(did2)
                      .collection('Subject')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/Sanskrit.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Computer") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did1)
                      .collection('Standard')
                      .doc(did2)
                      .collection('Subject')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/Computer.png"
                  });
                }
                _sectionController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      });
    });
  }
}
