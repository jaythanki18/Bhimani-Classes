import 'dart:io';


import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/materials.dart';
import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/pdfview.dart';
import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/video_play.dart';
import 'package:bhimani_classes/Users/Authentication/Fronend/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Folders extends StatefulWidget {
  String did1, did2, did3,name;

  Folders({
    required this.did1,
    required this.did2,
    required this.did3,
    required this.name
  });

  @override
  State<Folders> createState() =>
      _FoldersState(did1: did1, did2: did2, did3: did3,name: name);
}

class _FoldersState extends State<Folders> {
  String did1, did2, did3,name;

  _FoldersState({
    required this.did1,
    required this.did2,
    required this.did3,
    required this.name
  });

  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('admin');
  TextEditingController _folderNameController = new TextEditingController();

  Future<String> uploadPdf(String fileName, File file) async {
    final refrence = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
    final uploadTask = refrence.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await refrence.getDownloadURL();
    return downloadLink;
  }

  Future<String> uploadVideo(String fileName, File file) async {
    final refrence =
    FirebaseStorage.instance.ref().child("video/$fileName.mp4");
    final uploadTask = refrence.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await refrence.getDownloadURL();
    return downloadLink;
  }


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
        .doc(did3)
        .collection('Folders')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
          },
          icon: Icon(Icons.menu_outlined,size: 25,color: Color.fromRGBO(
              3, 54, 134, 1.0),),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(name,style: TextStyle(color: Color.fromRGBO(
            3, 54, 134, 1.0)),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }, icon: Icon(Icons.person,size:25,color: Color.fromRGBO(
              3, 54, 134, 1.0),))
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
                        if(data['type'].toString()=="folder")
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => (Materials(
                                did1: did1,
                                did2: did2,
                                did3: did3,
                                did4: document.id, name: data['name'],

                              )),
                            ),
                          );
                        }
                        if(data['type'].toString()=="pdf")
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => (pdfview(url:data['url'],name:data['name'])),
                            ),
                          );
                        }
                        if(data['type'].toString()=="video")
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => (VideoPlay(url: data['url'],name: data['name'],)),
                            ),
                          );
                        }
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(data['icon'],height: 100,width: 100,),
                            Text(
                              data['name'],
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromRGBO(
                                  3, 54, 134, 1.0,),overflow: TextOverflow.ellipsis),
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