// import 'package:flutter/material.dart';
//
// import 'Modules/announcement/announcement.dart';
// import 'Modules/attendance/attendance.dart';
// import 'Modules/fee/fees.dart';
// import 'Modules/messages/messages.dart';
// import 'Modules/result/result.dart';
// import 'Modules/syllabus/syllabus.dart';
// import 'Modules/timetable/timetable.dart';
//
// class DashBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: MyAppBar(),
//         drawer: Sidebar(), // Use the Sidebar widget for the drawer
//         body: Center(
//           child: IconBoxGrid(), // Use the IconBoxGrid widget to display the 6-icon box
//         ),
//       ),
//     );
//   }
// }
//
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: Icon(Icons.menu), // You can change this icon to your sidebar icon
//         onPressed: () {
//           // Open the sidebar when the menu icon is tapped
//           Scaffold.of(context).openDrawer();
//         },
//       ),
//       title: Text("Your App Title",
//         style: TextStyle(color: Colors.white), // Change the text color of the title
//       ),
//       backgroundColor: Colors.lightBlue, // Change the background color of the AppBar
//       actions: [
//         IconButton(
//           icon: Icon(Icons.announcement), // You can change this icon to your announcement icon
//           onPressed: () {
//             // Navigate to the AnnouncementPage when the announcement icon is tapped
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AnnouncementPage()),
//
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
//
//
// class Sidebar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.lightBlue,
//             ),
//             child: Text(
//               'Sidebar Header',
//               style: TextStyle(fontSize: 30, color: Colors.white),
//             ),
//           ),
//
//           // Add more list tiles for other sidebar items as needed
//         ],
//       ),
//     );
//   }
// }
//
// class IconBoxGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2, // Display 2 icons per row
//       padding: EdgeInsets.all(16.0),
//       mainAxisSpacing: 16.0,
//       crossAxisSpacing: 16.0,
//       children: [
//         IconBox(icon: Icons.pie_chart, text: "Attendence"),
//         IconBox(icon: Icons.calendar_month, text: "Result"),
//         IconBox(icon: Icons.subject, text: "Syllabus"),
//         IconBox(icon: Icons.payment, text: "Fees"),
//         IconBox(icon: Icons.schedule, text: "Time Table"),
//         IconBox(icon: Icons.message, text: "Message"),
//       ],
//     );
//   }
// }
//
// class IconBox extends StatelessWidget {
//
//   final IconData icon;
//   final String text;
//
//   const IconBox({required this.icon, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Add the logic for handling each icon box tap
//         print("$text icon tapped");
//
//         if (text == "Attendence") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Attendence()),
//           );
//         } else if (text == "Fees") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => fees()),
//           );
//         }
//         else if (text == "Syllabus") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) =>Syllabus()),
//           );
//         }
//         else if (text == "Result") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ResultPage()),
//           );
//         }
//
//         else if (text == "Time Table") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => timetable()),
//           );
//         }
//         else if (text == "Message") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => message()),
//           );
//         }
//       },
//
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.lightBlue,
//           borderRadius: BorderRadius.circular(14.0),
//         ),
//         padding: EdgeInsets.all(14.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40.0),
//             SizedBox(height: 5.0), // Adjusted the SizedBox height to accommodate the text
//             Text(text, style: TextStyle(fontSize: 20.0)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bhimani_classes/Admin/Authentication/Fronend/HomeScreen.dart';
import 'package:bhimani_classes/Users/Frontend/Modules/Syllabus/UserSubject.dart';
import 'package:bhimani_classes/page/create_sheets_page.dart';
import 'package:bhimani_classes/page/modify_shets_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Modules/Syllabus/standard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;

  CollectionReference ref = FirebaseFirestore.instance.collection('admin');

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: StreamBuilder<QuerySnapshot>(
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
                              builder: (context) => (UserSubject(
                              )
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
          ),

          Positioned(
            bottom: 30,
            // left: 0,
            right: 25,
            child: Row(
              children: [
                Center(
                  child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(3, 54, 134, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    onPressed: () async {
                      print('on click');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifyPage()));
                      // await showInformationDialogBox(context);
                    },
                    child: Icon(
                      Icons.menu,
                    ),
                  ),
                ),
                Center(
                  child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(3, 54, 134, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    onPressed: () async {
                      print('on click');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateSheetsPage()));
                      // await showInformationDialogBox(context);
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Future<void> showInformationDialogBox(BuildContext context) async {
  //   TextEditingController _sectionController = new TextEditingController();
  //   return await showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         bool isChecked = false;
  //         return StatefulBuilder(builder: (context, setState) {
  //           return AlertDialog(
  //             title: Text('Add Module'),
  //             content: TextField(
  //               controller: _sectionController,
  //               decoration: InputDecoration(
  //                 labelText: 'Enter Module Name',
  //                 labelStyle: TextStyle(
  //                     color: Colors.black), // Change the label text color
  //               ),
  //               style: TextStyle(color: Colors.blue), // Change the text color
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('Cancel'),
  //               ),
  //               TextButton(
  //                 onPressed: () {
  //                   // Create the folder
  //                   if (_sectionController.text != '' &&
  //                       _sectionController.text == 'Result') {
  //                     User? user = _auth.currentUser;
  //                     FirebaseFirestore.instance
  //                         .collection('admin')
  //                         .doc(user!.uid)
  //                         .collection('Dashboard')
  //                         .add({
  //                       "type": "section",
  //                       "name": _sectionController.text,
  //                       "icon": "assets/result.png"
  //                     });
  //                   }
  //                   if (_sectionController.text != '' &&
  //                       _sectionController.text == "Messages") {
  //                     User? user = _auth.currentUser;
  //                     FirebaseFirestore.instance
  //                         .collection('admin')
  //                         .doc(user!.uid)
  //                         .collection('Dashboard')
  //                         .add({
  //                       "type": "section",
  //                       "name": _sectionController.text,
  //                       "icon": "assets/message.png"
  //                     });
  //                   }
  //                   if (_sectionController.text != '' &&
  //                       _sectionController.text == "Time Table") {
  //                     User? user = _auth.currentUser;
  //                     FirebaseFirestore.instance
  //                         .collection('admin')
  //                         .doc(user!.uid)
  //                         .collection('Dashboard')
  //                         .add({
  //                       "type": "section",
  //                       "name": _sectionController.text,
  //                       "icon": "assets/timetable.png"
  //                     });
  //                   }
  //                   if (_sectionController.text != '' &&
  //                       _sectionController.text == "Attendance") {
  //                     User? user = _auth.currentUser;
  //                     FirebaseFirestore.instance
  //                         .collection('admin')
  //                         .doc(user!.uid)
  //                         .collection('Dashboard')
  //                         .add({
  //                       "type": "section",
  //                       "name": _sectionController.text,
  //                       "icon": "assets/attendance.png"
  //                     });
  //                   }
  //
  //                   if (_sectionController.text != '' &&
  //                       _sectionController.text == "Syllabus") {
  //                     User? user = _auth.currentUser;
  //                     FirebaseFirestore.instance
  //                         .collection('admin')
  //                         .doc(user!.uid)
  //                         .collection('Dashboard')
  //                         .add({
  //                       "type": "section",
  //                       "name": _sectionController.text,
  //                       "icon": "assets/syllabus.png"
  //                     });
  //                   }
  //
  //                   if (_sectionController.text != '' &&
  //                       _sectionController.text == "Fees") {
  //                     User? user = _auth.currentUser;
  //                     FirebaseFirestore.instance
  //                         .collection('admin')
  //                         .doc(user!.uid)
  //                         .collection('Dashboard')
  //                         .add({
  //                       "type": "section",
  //                       "name": _sectionController.text,
  //                       "icon": "assets/fees.png"
  //                     });
  //                   }
  //                   _sectionController.clear();
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('Add'),
  //               ),
  //             ],
  //           );
  //         });
  //       });
  // }
}
