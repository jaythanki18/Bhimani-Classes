import 'package:bhimani_classes/Admin/Authentication/Backend/Utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Backend/Provider/AuthProvider.dart';

import 'OtpScreen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  //Sliding Image
  List imageList = [
    {"id": 1, "image_path": 'assets/A1.png'},
    {"id": 2, "image_path": 'assets/A2.png'},
   // {"id": 3, "image_path": 'image/A3.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  //Phone NO.
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.19,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 1),
              alignment: Alignment.topCenter,
              color: Colors.white,
              height: height * 0.5,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map((item) => Image.asset(
                        item['image_path'],
                      ))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        height: height * 0.4,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.3,
              width: widtht * 0.974,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
              // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                // border: Border.all(width: 1,color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(87, 7, 169, 1.0),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(87, 7, 169, 1.0),
                      Color.fromRGBO(74, 17, 128, 1.0)
                    ]),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 29, horizontal: 29),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: widtht * 0.009,
                        ),
                        SizedBox(
                          height: height * 0.05,
                          width: widtht * 0.18,
                          child: ElevatedButton(
                              onPressed: () {
                                showCountryPicker(
                                    context: context,
                                    countryListTheme: CountryListThemeData(
                                      bottomSheetHeight: height * 0.8,
                                      searchTextStyle: TextStyle(color: Color.fromRGBO(87, 7, 169, 1.0),),
                                      inputDecoration: InputDecoration(
                                        hintStyle: TextStyle(color: Color.fromRGBO(87, 7, 169, 1.0)),
                                        hintText: 'Search',
                                        labelText: 'Search',
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                      ),
                                    ),
                                    onSelect: (value) {
                                      setState(() {
                                        selectedCountry = value;
                                      });
                                    });
                              },
                              child: Text("+${selectedCountry.phoneCode}", style: TextStyle(fontSize: 15.2),),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(88, 82, 112, 100),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10)))),
                        ),
                        SizedBox(
                          width: widtht * 0.035,
                        ),
                        Expanded(
                          child: TextFormField(
                            // cursorColor: Colors.purple,
                            controller: phoneController,
                            style: TextStyle(
                              color: phoneController.text.length < 11 ? Colors.purple : Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              setState(() {
                                phoneController.text = value;
                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Mobile Number"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if(phoneController.text.length == 10)
                            {
                              sendPhoneNumber();
                            }
                            else
                            {
                              showSnackBar(context, "Please enter valid phone no.");
                            }
                          },
                          child: Text("Send OTP",
                              style: TextStyle(color: Colors.purple)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      height: 40,
                      child: TextButton(
                          child: Text(
                            "Privacy Policy | T&C",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          onPressed: () {
                            print('Pressed');
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void sendPhoneNumber() {

    final ap = Provider.of<AuthProvider>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(),
      ),
    );
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }

}


