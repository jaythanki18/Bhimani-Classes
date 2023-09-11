import 'package:flutter/material.dart';

class Attendence extends StatelessWidget {
  const Attendence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Announcement"),
      ),
      body: Center(
        child: Text("This is the announcement page",
        ),
      ),
    );
  }
}