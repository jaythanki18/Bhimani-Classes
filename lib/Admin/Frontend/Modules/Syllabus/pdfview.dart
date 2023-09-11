import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfview extends StatefulWidget {
  String url,name;

  pdfview({
    required this.url,required this.name,
  });

  @override
  State<pdfview> createState() => _pdfviewState(url:url,name:name);
}

class _pdfviewState extends State<pdfview> {
  String url,name;

  _pdfviewState({
    required this.url,required this.name,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name,style: TextStyle(color: Colors.indigo),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.indigo,)),
        actions: <Widget>[
          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.manage_search_outlined,color: Colors.indigo.shade500,size: 30,)),
        ],
      ),
      body: SfPdfViewer.network(
        url,
      ),
    );
  }
}
// // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',