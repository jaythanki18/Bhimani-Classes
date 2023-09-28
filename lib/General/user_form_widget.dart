import 'package:bhimani_classes/General/button_widget.dart';
import 'package:bhimani_classes/model/user.dart';
import 'package:flutter/material.dart';

class UserFormWidget extends StatefulWidget {
  final User? user;
  final ValueChanged<User> onSavedUser;
  const UserFormWidget({Key? key, required this.onSavedUser, this.user}) : super(key: key);

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {

  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late bool isBeginner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  void didUpdateWidget(covariant UserFormWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  void initUser(){
    final name = widget.user==null ? '' : widget.user!.name;
    final email = widget.user==null ? '' : widget.user!.email;
    final isBeginner = widget.user==null ? true : widget.user!.isBeginner;

    setState(() {
      controllerName = TextEditingController(text: name);
      controllerEmail = TextEditingController(text: email);
      this.isBeginner = isBeginner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildName(),
          SizedBox(height: 16,),
          buildEmail(),
          SizedBox(height: 16,),
          buildFlutterBeginner(),
          buildSubmit(),

        ],
      ),
    );
  }

  Widget buildFlutterBeginner()=>SwitchListTile(
    contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: isBeginner,
      title: Text('Is Flutter Beginner'),
      onChanged: (value)=>setState(() {
        isBeginner=value;
      })
  );

  Widget buildName()=>TextFormField(
    controller: controllerName,
    decoration: InputDecoration(
      labelText: 'Name',
      border: OutlineInputBorder(),
    ),
    validator: (value)=>
      value!=null && value.isEmpty ? 'Enter Name' : null,
  );

  Widget buildEmail()=>TextFormField(
    controller: controllerEmail,
    decoration: InputDecoration(
      labelText: 'Email',
      border: OutlineInputBorder(),
    ),
    validator: (value)=>
    value!=null && !value.contains('@') ? 'Enter Name' : null,
  );

  Widget buildSubmit()=>ButtonWidget(
      text: 'Save',
      onClicked: (){
        final form = formKey.currentState!;
        final isValid = form.validate();
        if(isValid){
          final id = widget.user == null ? null : widget.user!.id;
          final user = User(
            id: id,
              name: controllerName.text,
              email: controllerEmail.text,
              isBeginner: isBeginner
          );
          widget.onSavedUser(user);
        }
        print(controllerName.text);
        print(controllerEmail.text);
      }
  );
}
