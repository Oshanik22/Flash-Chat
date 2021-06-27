import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'file:///D:/FlutterProjects/flash-chat-flutter/lib/components/general_button.dart';
import 'file:///D:/FlutterProjects/flash-chat-flutter/lib/components/general_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {

 static const  String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              GeneralTextField(onChanged: (value){
                email = value;
              },
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your email',
              ),
              SizedBox(
                height: 8.0,
              ),
              GeneralTextField(onChanged: (value){
                password = value;
              },
                textInputType: TextInputType.text,
                hintText: 'Enter Password',
                obscureText: true,

              ),
              SizedBox(
                height: 24.0,
              ),
              GeneralButton(text: 'Register', onPressed:  ()async{


                setState(() {
                  showSpinner = true;
                });

                try{
                   final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                   if(newUser != null){
                     Navigator.pushNamed(context, ChatScreen.id);
                   }
                }catch(e){
                  print(e); //TODO add the error message above login and regitration button
                }
                setState(() {
                  showSpinner = false;
                });

                print(email);
                print(password);
              }, colour: kRegisterButtonColor),
            ],
          ),
        ),
      ),
    );
  }
}
