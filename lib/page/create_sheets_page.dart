// import 'package:bhimani_classes/api/sheets/user_sheets_api.dart';
// import 'package:bhimani_classes/page/modify_shets_page.dart';
// import 'package:flutter/material.dart';
// import '../General/button_widget.dart';
// import '../model/user.dart';
//
// class CreateSheetpage extends StatefulWidget {
//   final User? user;
//   final ValueChanged<User> onSavedUser;
//
//   const CreateSheetpage({
//     Key? key,
//     required this.onSavedUser, this.user
//   })
//       : super(key: key);
//
//   @override
//   State<CreateSheetpage> createState() => _CreateSheetpageState();
// }
//
// class _CreateSheetpageState extends State<CreateSheetpage> {
//
//   final formKey = GlobalKey<FormState>();
//   late TextEditingController controllerName;
//   late TextEditingController controllerEmail;
//   late bool isBeginner;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initUser();
//   }
//
//   void initUser() {
//     final name=widget.user ==  null ? '' : widget.user!.name;
//     final email=widget.user ==  null ? '' : widget.user!.email;
//     final isBeginner=widget.user ==  null ? true : widget.user!.isBeginner;
//     controllerName = TextEditingController();
//     controllerEmail = TextEditingController();
//     this.isBeginner = true;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Google Sheet API"),
//         centerTitle: true,
//       ),
//       body: Form(
//         key: formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextFormField(
//                   controller: controllerName,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) =>
//                       value != null && value.isEmpty ? 'Enter name' : null),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                   controller: controllerEmail,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) => value != null && !value.contains('@')
//                       ? 'Enter email'
//                       : null),
//               SizedBox(
//                 height: 10,
//               ),
//               SwitchListTile(
//                 value: isBeginner,
//                 onChanged: (value) {
//                   setState(() {
//                     isBeginner=value;
//                   });
//                 },
//                 contentPadding: EdgeInsets.zero,
//                 controlAffinity: ListTileControlAffinity.leading,
//                 title: Text('Is beginner?'),
//               ),
//               ButtonWidget(
//                 text: 'Save',
//                 onClicked: () async {
//                   final form = formKey.currentState;
//                   final isValid = form!.validate();
//                   if (isValid) {
//                     final user = User(
//                         name: controllerName.text,
//                         email: controllerEmail.text,
//                         isBeginner: isBeginner
//                     );
//
//                     widget.onSavedUser(user);
//
//                     final id = await UserSheetsAPI.getRowCount()+1;
//                     final newUser=user.copy(id:id);
//                     await UserSheetsAPI.insert([newUser.toJson()]);
//                   }
//
//                 },
//               ),
//               TextButton(onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifyPage()));
//               }, child: Text("Go to next screen")
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bhimani_classes/General/button_widget.dart';
import 'package:bhimani_classes/api/sheets/user_sheets_api.dart';
import 'package:bhimani_classes/main.dart';
import 'package:bhimani_classes/model/user.dart';
import 'package:flutter/material.dart';

import '../General/user_form_widget.dart';

class CreateSheetsPage extends StatelessWidget {
  const CreateSheetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Sheets API"),
        centerTitle: true,
      ),
      body:
          Container(
            alignment: Alignment.center,
              padding: EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: UserFormWidget(
                  onSavedUser: (user) async{
                    final id = await UserSheetsAPI.getRowCount()+1;
                    final newUser = user.copy(id: id);
                    await UserSheetsAPI.insert([newUser.toJson()]);
                  },
                ),
              )
          ),
    );
  }
  Future insertUsers() async{
    final users = [
      User(name: "abc", email: "email", isBeginner: false),
    User(name: "xyz", email: "email", isBeginner: true)
    ];
    final jsonUsers = users.map((user) => user.toJson()).toList();
    await UserSheetsAPI.insert(jsonUsers);
  }
}
