import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(message());
}
class message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Page Demo'),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            child: SizedBox(
              width: 50, // Adjust the width as needed
              height: 50, // Same value as width to make it a square
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createOverlay());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Half of the width and height
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 20, // Adjust the size of the icon
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Route _createOverlay() {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return OverlayPage();
      },
    );
  }
}



class OverlayPage extends StatelessWidget {
  // Future<void> _pickFile(BuildContext context) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     PlatformFile file = result.files.first;
  //     print('Picked file: ${file.name}');
  //   } else {
  //     print('No file picked.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your text...',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => {},
                child: Text('Pick a File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}