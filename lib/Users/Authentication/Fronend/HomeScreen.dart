import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Backend/Provider/AuthProvider.dart';
import '../../../General/WelcomeScreen.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(45, 87, 152, 1.0),
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
              Stack(
                children:[
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight:Radius.circular(50) ),
                    child: Container(
                      height: 130,
                      width: widtht,
                      color: Color.fromRGBO(45, 87, 152, 1.0),
                    ),
                  ),
                 // Text("data"),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(

                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 50),
                        child: CircleAvatar(
                          backgroundColor:Colors.blue,
                          backgroundImage: NetworkImage(ap.userModel.profilePic),
                          radius: 50,
                        ),
                      ),

                      SizedBox(
                       width: widtht*0.05,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    ap.userModel.name,
                                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                              SizedBox(width: 5,),
                              Text('|',style: TextStyle(color: Colors.white),),
                              SizedBox(width: 5,),
                              Text('Roll No : 1',style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ]
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.phone,color:Color.fromRGBO(45, 87, 152, 1.0) ,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Phone number",style: TextStyle(color: Color.fromRGBO(45, 87, 152, 1.0),fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(ap.userModel.phoneNumber, style: TextStyle(fontSize: 17, color: Color.fromRGBO(45, 87, 152, 1.0),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.email,color:Color.fromRGBO(45, 87, 152, 1.0) ,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Email Address",style: TextStyle(color: Color.fromRGBO(45, 87, 152, 1.0),fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(ap.userModel.email, style: TextStyle(fontSize: 17, color: Color.fromRGBO(45, 87, 152, 1.0),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.location_on,color:Color.fromRGBO(45, 87, 152, 1.0) ,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Location",style: TextStyle(color: Color.fromRGBO(45, 87, 152, 1.0),fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(ap.userModel.location, style: TextStyle(fontSize: 17, color: Color.fromRGBO(45, 87, 152, 1.0),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.person,color:Color.fromRGBO(45, 87, 152, 1.0) ,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Gender",style: TextStyle(color: Color.fromRGBO(45, 87, 152, 1.0),fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text("Male", style: TextStyle(fontSize: 17, color: Color.fromRGBO(45, 87, 152, 1.0),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.date_range,color:Color.fromRGBO(45, 87, 152, 1.0) ,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Date Of Birth",style: TextStyle(color: Color.fromRGBO(45, 87, 152, 1.0),fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text("DD/MM/YYYY", style: TextStyle(fontSize: 17, color: Color.fromRGBO(45, 87, 152, 1.0),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: height * 0.08,
                thickness: 2,
                color: Color.fromRGBO(45, 87, 152, 1.0)
              ),
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

                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(45, 87, 152, 1.0))),
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
                height: height * 0.01,
              )
            ],
          ),
        ));
  }
}
