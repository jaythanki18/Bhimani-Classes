import 'package:bhimani_classes/Admin/Authentication/Fronend/PhoneScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Frontend/Dashboard.dart';
import '../Backend/Provider/AuthProvider.dart';

class AskUser extends StatefulWidget {
  const AskUser({Key? key}) : super(key: key);

  @override
  State<AskUser> createState() => _AskUserState();
}

class _AskUserState extends State<AskUser> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Join with us as a',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(
                3, 54, 134, 1.0)),),
            SizedBox(height: 20,),
            InkWell(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Image.asset('assets/admin.png'),
                    ),
                    SizedBox(height: 5,),
                    Text("Admin",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromRGBO(
                        3, 54, 134, 1.0)),),
                  ],
                ),
                onTap: ()async {
                  if (ap.isSignedIn == true) {
                    await ap.getDataFromSP().whenComplete(
                          () =>
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dashboard(),
                            ),
                          ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneScreen(),
                      ),
                    );
                  }
                }

            ),


            SizedBox(height: 20,),
            InkWell(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Image.asset('assets/man.png'),
                    ),
                    SizedBox(height: 5,),
                    Text("User",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromRGBO(
                        3, 54, 134, 1.0)),),
                  ],
                ),
                onTap: ()async {
                }
            ),
          ],
        ),
      ),
    );
  }
}
