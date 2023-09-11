import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Backend/Provider/AuthProvider.dart';
import 'WelcomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(97, 0, 169, 1.0),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(97, 0, 169, 1.0),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Edit Details',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: widtht*0.04,),

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              CircleAvatar(
                backgroundColor: Colors.purple,
                backgroundImage: NetworkImage(ap.userModel.profilePic),
                radius: 50,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ap.userModel.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ap.userModel.course,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.075,
                  ),
                  Container(
                    height: height * 0.1,
                    width: widtht * 0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.03,
                            ),
                            Text(
                              'Mobile Number',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(1.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.04,
                            ),
                            Text(
                              ap.userModel.phoneNumber,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.075,
                  ),
                  Container(
                    height: height * 0.1,
                    width: widtht * 0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.03,
                            ),
                            Text(
                              'Email ID',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(1.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.04,
                            ),
                            Text(
                              ap.userModel.email,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.075,
                  ),
                  Container(
                    height: height * 0.1,
                    width: widtht * 0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.03,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(1.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.04,
                            ),
                            Text(
                              ap.userModel.location,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.075,
                  ),
                  Container(
                    height: height * 0.1,
                    width: widtht * 0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.03,
                            ),
                            Text(
                              'Gender',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(1.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.04,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.075,
                  ),
                  Container(
                    height: height * 0.1,
                    width: widtht * 0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.03,
                            ),
                            Text(
                              'Date of Birth',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(1.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widtht * 0.04,
                            ),
                            Text(
                              'DD/MM/YYYY',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: height * 0.08,
                thickness: 2,
                color: Color.fromRGBO(242, 212, 255, 1.0),
              ),
              // SizedBox(
              //   height: height * 0.1,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: widtht * 0.01,
                  ),
                  TextButton(
                    onPressed: () {
                      ap.userSignOut().then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            ),
                          );
                    },
                    child: Text(
                      'Sign out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              )
            ],
          ),
        ));
  }
}
