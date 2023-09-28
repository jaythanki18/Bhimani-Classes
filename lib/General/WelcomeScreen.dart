import 'package:bhimani_classes/General/AskForAdminOrUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Admin/Authentication/Backend/Provider/AuthProvider.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: MediaQuery.of(context).size.height*0.40,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 20),
                 Container(
                   height: 50,
                   width: 250,
                   child: ElevatedButton(
                     style: ButtonStyle(
                       shape: MaterialStatePropertyAll(
                           RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.grey),borderRadius: BorderRadius.circular(12))),
                         backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(45, 87, 152, 1.0))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AskUser()));
                    },
                    child:Text("Let's get started",style: TextStyle(
                      fontSize: 20,
                    ),),

                ),
                 ),
                const SizedBox(height: 10),
                const Text(
                  "Never a better time than now to start.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
