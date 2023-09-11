import 'dart:io';
import 'package:bhimani_classes/Admin/Authentication/Backend/Utils/utils.dart';
import 'package:bhimani_classes/Admin/Frontend/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Backend/Provider/AuthProvider.dart';
import '../Backend/UserModel/UserModel.dart';

import 'HomeScreen.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final courseController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    courseController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;
    String? email;

    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          reverse: true,
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: height * 0.09,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: (Text(
                        "\t\t\t\t\t Help us personalise \n your teaching experience",
                        style: TextStyle(
                            color: Color.fromRGBO(87, 7, 169, 1.0),
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    InkWell(
                      onTap: () => selectImage(),
                      child: image == null
                          ? const CircleAvatar(
                              backgroundColor: Color.fromRGBO(87, 7, 169, 1.0),
                              radius: 50,
                              child: Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(image!),
                              radius: 50,
                            ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: widtht * 0.09),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Color.fromRGBO(87, 7, 169, 1.0),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: widtht * 0.05,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: nameController,
                                    cursorColor:
                                        Color.fromRGBO(87, 7, 169, 1.0),
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Channel Name  *',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      floatingLabelStyle: TextStyle(
                                        color: Color.fromRGBO(87, 7, 169, 1.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(87, 7, 169, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_sharp,
                                  color: Color.fromRGBO(87, 7, 169, 1.0),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: widtht * 0.05,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: emailController,
                                    cursorColor:
                                        Color.fromRGBO(87, 7, 169, 1.0),
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'E-Mail *',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      floatingLabelStyle: TextStyle(
                                        color: Color.fromRGBO(87, 7, 169, 1.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(87, 7, 169, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color.fromRGBO(87, 7, 169, 1.0),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: widtht * 0.05,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: locationController,
                                    cursorColor:
                                        Color.fromRGBO(87, 7, 169, 1.0),
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Location *',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      floatingLabelStyle: TextStyle(
                                        color: Color.fromRGBO(87, 7, 169, 1.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(87, 7, 169, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              children: [
                                Icon(
                                    Icons.book_sharp,
                                    color: Color.fromRGBO(87, 7, 169, 1.0),
                                    size: 35,
                                ),
                                SizedBox(
                                  width: widtht * 0.05,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: courseController,
                                    cursorColor:
                                        Color.fromRGBO(87, 7, 169, 1.0),
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Select Grade/Course *',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      floatingLabelStyle: TextStyle(
                                        color: Color.fromRGBO(87, 7, 169, 1.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(87, 7, 169, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(87, 7, 169, 1.0),
                                    onPrimary: Colors.white,
                                    shadowColor:
                                        Color.fromRGBO(87, 7, 169, 1.0),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    minimumSize: Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    email = emailController.text.trim();
                                    if (nameController.text.trim().isEmpty) {
                                      showSnackBar(
                                          context, 'Please enter channel name');
                                    } else if (!isValidEmail(email!)) {
                                      showSnackBar(context,
                                          'Please enter valid mail id');
                                      print('$email is a valid email address.');
                                    } else if (locationController.text
                                        .trim()
                                        .isEmpty) {
                                      showSnackBar(context,
                                          'Please enter your location');
                                    } else if (courseController.text
                                        .trim()
                                        .isEmpty) {
                                      showSnackBar(
                                          context, 'Please enter your course');
                                    } else {
                                      storeData();
                                    }
                                  },
                                  child: Text('Start Teaching'),
                                ),
                                SizedBox(
                                  height: height * 0.08,
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                )),
    );
  }

  // Email validation
  bool isValidEmail(String email) {
    // Regular expression pattern for validating email addresses
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$');

    // Check if the email matches the pattern
    return emailRegex.hasMatch(email);
  }

  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      location: locationController.text.trim(),
      course: courseController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                          (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
