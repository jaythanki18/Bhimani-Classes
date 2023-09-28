import 'package:bhimani_classes/Users/Authentication/Fronend/HomeScreen.dart';
import 'package:bhimani_classes/Users/Frontend/Modules/Syllabus/UserSubject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Modules/Syllabus/standard.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final _auth = FirebaseAuth.instance;

  CollectionReference ref = FirebaseFirestore.instance.collection('admin');

  @override
  Widget build(BuildContext context) {

    User? user = _auth.currentUser;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('admin')
        .doc(user!.uid)
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
          'Bhimani Classes',
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
                            builder: (context) => (UserSubject()
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,

                            // border: Border.all(),
                            borderRadius: BorderRadius.circular(12)),
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
}
