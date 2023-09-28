import 'dart:io';


import 'package:bhimani_classes/Admin/Authentication/Fronend/HomeScreen.dart';
import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/materials.dart';
import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/pdfview.dart';
import 'package:bhimani_classes/Admin/Frontend/Modules/Syllabus/video_play.dart';
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
          Positioned(
            bottom: 30,
            // left: 0,
            right: 25,
            child: Center(
              child: FloatingActionButton(
                backgroundColor:Color.fromRGBO(
                    3, 54, 134, 1.0) ,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0))),
                        child: GridView.count(
                          crossAxisCount: 3,
                          padding: EdgeInsets.all(16.0),
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Create New Folder'),
                                            content: TextField(
                                              controller: _folderNameController,
                                              decoration: InputDecoration(
                                                labelText: 'Folder Name',
                                                labelStyle: TextStyle(
                                                    color: Colors
                                                        .black), // Change the label text color
                                              ),
                                              style: TextStyle(
                                                  color: Colors
                                                      .blue), // Change the text color
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
                                                  if (_folderNameController
                                                      .text !=
                                                      '') {
                                                    User? user =
                                                        _auth.currentUser;
                                                    FirebaseFirestore.instance
                                                        .collection('admin')
                                                        .doc(user!.uid)
                                                        .collection('Dashboard')
                                                        .doc(did1)
                                                        .collection('Standard')
                                                        .doc(did2)
                                                        .collection('Subject')
                                                        .doc(did3)
                                                        .collection('Folders')
                                                        .add({
                                                      "type": "folder",
                                                      "name":
                                                      _folderNameController
                                                          .text,
                                                      "icon":"assets/folder.png"
                                                    });
                                                  }
                                                  _folderNameController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Create'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.folder),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Folder")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.live_tv_outlined),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Live")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.document_scanner),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Scan")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () async{
                                      final pickedFile = await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf'],
                                      );

                                      if (pickedFile != null) {
                                        String fileName = pickedFile.files[0].name;
                                        File file = File(pickedFile.files[0].path!);
                                        final downloadLink = await uploadPdf(fileName, file);

                                        User? user = _auth.currentUser;
                                        await FirebaseFirestore.instance
                                            .collection('admin')
                                            .doc(user!.uid)
                                            .collection('Dashboard')
                                            .doc(did1)
                                            .collection('Standard')
                                            .doc(did2)
                                            .collection('Subject')
                                            .doc(did3)
                                            .collection('Folders')
                                            .add({
                                          "name": fileName,
                                          "url": downloadLink,
                                          "type": "pdf",
                                          "icon":"assets/pdf.png"
                                        });
                                        const snackBar = SnackBar(
                                          content: Text('pdf uploaded sucessfully!'),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        print("pdf uploaded sucessfully");
                                      }
                                    },
                                    icon: Icon(Icons.upload_file_outlined),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Upload File")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () async{
                                      final pickedFile = await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['mp4'],
                                      );

                                      if (pickedFile != null) {
                                        String fileName = pickedFile.files[0].name;
                                        File file = File(pickedFile.files[0].path!);
                                        final downloadLink = await uploadVideo(fileName, file);

                                        User? user = _auth.currentUser;
                                        await FirebaseFirestore.instance
                                            .collection('admin')
                                            .doc(user!.uid)
                                            .collection('Dashboard')
                                            .doc(did1)
                                            .collection('Standard')
                                            .doc(did2)
                                            .collection('Subject')
                                            .doc(did3)
                                            .collection('Folders')
                                            .add({
                                          "name": fileName,
                                          "url": downloadLink,
                                          "type": "video",
                                          "icon":"assets/video.png"
                                        });
                                        const snackBar = SnackBar(
                                          content: Text('Video uploaded sucessfully!'),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        print("video uploaded sucessfully");
                                      }
                                    },
                                    icon: Icon(Icons.upload),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Upload Video")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Share")
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );

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
}