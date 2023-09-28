import 'package:bhimani_classes/Users/Authentication/Fronend/HomeScreen.dart';
import 'package:bhimani_classes/Users/Frontend/Modules/Syllabus/folders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../model/user.dart';

class UserSubject extends StatefulWidget {
  const UserSubject({Key? key}) : super(key: key);

  @override
  State<UserSubject> createState() => _UserSubjectState();
}

class _UserSubjectState extends State<UserSubject> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('admin')
        .doc('UCIxdbMJPQh9jlwjBWiK779Vxt32')
        .collection('Dashboard')
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => (Folders(
                        //       did1: id1,
                        //       did2: id2,
                        //       did3: document.id,
                        //       name: data['name'],
                        //     )),
                        //   ),
                        // );
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
        ],
      ),
    );
  }

  Future<String> getID1(String attributeName, String attributeValue) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .doc('UCIxdbMJPQh9jlwjBWiK779Vxt32')
          .collection('Dashboard') // Replace with your collection name
          .where(attributeName, isEqualTo: attributeValue)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you expect only one document with this attribute value
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        final String documentID = documentSnapshot.id;
        print('Document ID: $documentID');
        return documentID;
      } else {
        print('Document with attribute not found.');
      }
    } catch (e) {
      print('Error getting document ID: $e');
    }
    return "";
  }

  Future<String> getID2(
      String attributeName, String attributeValue, String id1) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .doc('UCIxdbMJPQh9jlwjBWiK779Vxt32')
          .collection('Dashboard')
          .doc(id1)
          .collection('Standard') // Replace with your collection name
          .where(attributeName, isEqualTo: attributeValue)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you expect only one document with this attribute value
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        final String documentID = documentSnapshot.id;
        print('Document ID: $documentID');
        return documentID;
      } else {
        print('Document with attribute not found.');
      }
    } catch (e) {
      print('Error getting document ID: $e');
    }
    return "";
  }
}
