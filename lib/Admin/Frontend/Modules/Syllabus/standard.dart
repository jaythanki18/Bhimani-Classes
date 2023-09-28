import 'package:bhimani_classes/Admin/Authentication/Fronend/HomeScreen.dart';
import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/subjects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Standard extends StatefulWidget {
  String did;

  Standard({
    required this.did,
  });

  @override
  State<Standard> createState() => _StandardState(did: did);
}

class _StandardState extends State<Standard> {
  String did;

  _StandardState({
    required this.did,
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
        .doc(did)
        .collection('Standard')
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
          'Standard',
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
                        print(
                          data['Section'],
                        );
                        print(
                          document.id,
                        );
                        print(document.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Subjects(
                              did1: did,
                              did2: document.id,
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
                 await showStandardDialogBox(context);
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
  Future<void> showStandardDialogBox(BuildContext context) async{
    TextEditingController _sectionController = new TextEditingController();
    return await showDialog(barrierDismissible: false,context: context, builder: (context){
      bool isChecked=false;
      return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          title: Text('Add Grade'),
          content: TextField(
            controller: _sectionController,
            decoration: InputDecoration(
              labelText: 'Enter Grade',
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
                    _sectionController.text == "Grade 6") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/six.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Grade 7") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/seven.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Grade 8") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/eight.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Grade 9") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/nine.png"
                  });
                }

                if (_sectionController.text != '' &&
                    _sectionController.text == "Grade 10") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/ten.png"
                  });
                }

                if (_sectionController.text != '' &&
                    _sectionController.text == "Grade 11") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/eleven.png"
                  });
                }
                if (_sectionController.text != '' &&
                    _sectionController.text == "Grade 12") {
                  User? user = _auth.currentUser;
                  FirebaseFirestore.instance
                      .collection('admin')
                      .doc(user!.uid)
                      .collection('Dashboard')
                      .doc(did)
                      .collection('Standard')
                      .add({
                    "type": "section",
                    "name": _sectionController.text,
                    "icon": "assets/twelve.png"
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
