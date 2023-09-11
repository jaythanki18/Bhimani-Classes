import 'package:flutter/material.dart';
class timetable extends StatefulWidget {
  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}
class _FilePickerPageState extends State<timetable> {
  String _filePath = '';

  // Function to handle file picking
  // Future<void> _pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //     if (result != null) {
  //       setState(() {
  //         _filePath = result.files.single.path!;
  //         debugPrint("Path : "+_filePath);
  //       });
  //     } else {
  //       // User canceled the picker
  //     }
  //   } catch (e) {
  //     print("Error while picking the file: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){},
              child: Text('Pick a File'),
            ),
            SizedBox(height: 16),
            Text('Selected File: $_filePath'),

          ],
        ),
      ),
    );
  }
}