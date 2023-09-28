import 'package:bhimani_classes/General/user_form_widget.dart';
import 'package:bhimani_classes/api/sheets/user_sheets_api.dart';
import 'package:flutter/material.dart';

import '../General/button_widget.dart';
import '../model/user.dart';

class ModifyPage extends StatefulWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
// User? user;
  List<User> users = [];
  int index = 0;
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  late bool isBeginner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.isBeginner = true;
    getUsers();
  }

  Future getUsers() async {
    final users = await UserSheetsAPI.getAll();
    //print(user!.toJson());
    // print(controllerName.text);
    // print(controllerEmail.text);

    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          children: [
            UserFormWidget(
                // user : users.isEmpty ? null : users[index],
                user: users.isEmpty ? null : users[index],
                onSavedUser: (user) async {
                  //await UserSheetsAPI.update(user.id!, user.toJson());
                 // UserSheetsAPI.updateCell(id: 4, key: 'email', value: 'jaythanki2004@gmail.com');
                }),
            const SizedBox(
              height: 16,
            ),
            if (users.isNotEmpty) buildUserControls(),
          ],
        ),
      ),
    );
  }

  Widget buildUserControls() => Column(
    children: [
      ButtonWidget(text: 'Delete', onClicked: deleteUser),
      SizedBox(height: 16,),
      NavigateUsersWidget(
            text: '${index+1}/${users.length} Users',
            onClickedNext: () {
              final nextIndex = index>=users.length-1 ?0: index+1;
              setState(() {
                index=nextIndex;
              });
            },
            onClickedPrevious: () {
              final previousIndex =index<=0 ? users.length-1 : index-1;
              setState(() {
                index=previousIndex;
              });
            },
          ),
    ],
  );
  Future deleteUser() async{
    final user = users[index];
    await UserSheetsAPI.deleteById(user.id!);

    //For updating UI
    final newIndex = index>0 ? index-1 : 0;
   // await getUsers(index:newIndex);
  }
}

class NavigateUsersWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedPrevious;
  final VoidCallback onClickedNext;

  const NavigateUsersWidget({Key? key,required this.text,required this.onClickedNext,required this.onClickedPrevious}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: onClickedPrevious,iconSize: 40, icon: Icon(Icons.navigate_before)),
        Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        IconButton(iconSize: 48,onPressed: onClickedNext, icon: Icon(Icons.navigate_next)),
      ],
    );
  }
}

