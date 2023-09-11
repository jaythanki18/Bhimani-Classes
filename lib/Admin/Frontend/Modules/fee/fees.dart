import 'package:flutter/material.dart';

class fees extends StatelessWidget {
  const fees({super.key});

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