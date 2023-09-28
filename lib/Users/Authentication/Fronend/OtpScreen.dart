import 'package:bhimani_classes/Users/Authentication/Backend/Utils/utils.dart';
import 'package:bhimani_classes/Users/Frontend/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import '../Backend/Provider/AuthProvider.dart';
import 'UserInformationScreen.dart';

class OtpScreen extends StatefulWidget {
  // final String verificationId;

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(87, 7, 169, 1.0),
      body: SingleChildScrollView(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Verify",
                          style: TextStyle(fontSize: 25, color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("A 6-digit OTP has been sent to",
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.white.withOpacity(0.1),
                    cursorColor: Colors.white,
                    borderColor: Color.fromRGBO(87, 7, 169, 1.0),
                    textStyle: TextStyle(color: Colors.white),
                    focusedBorderColor: Color.fromRGBO(87, 7, 169, 1.0),
                    filled: true,
                    onSubmit: (otp) {
                      otpCode = otp;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                              showSnackBar(context, "Enter 6-Digit code");
                            }
                          },
                          child: Text("Verify OTP",
                              style: TextStyle(
                                  color: Color.fromRGBO(87, 7, 169, 1.0),
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend OTP ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      SizedBox(
                          child: Text("Get OTP on call",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)))
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: ap.verify,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UserDashboard(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserInformationScreen()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
