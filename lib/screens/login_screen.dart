import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'file:///D:/FlutterProjects/flash-chat-flutter/lib/components/general_button.dart';
import 'package:flutter/material.dart';
import 'file:///D:/FlutterProjects/flash-chat-flutter/lib/components/general_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner  = false;
  String email;
  String password;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.blue,
      inAsyncCall:showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',  
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              GeneralTextField(hintText: 'Enter your Email',
              onChanged: (value){
                email = value;
              },
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8.0,
              ),
              GeneralTextField(hintText: 'Enter Password',
              obscureText: true,
              textInputType: TextInputType.text,
              onChanged: (value){
                password = value;
              },),
              SizedBox(
                height: 24.0,
              ),
              GeneralButton(text: "Log In", onPressed: () async{

                setState(() {
                  showSpinner = true;
                });

                try{
                  final user =  await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if (user != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }
                catch(e)
                {
                  print(e);
                }

                setState(() {
                  showSpinner = false;
                });
              }, colour: kLoginButtonColor)
            ],
          ),
        ),
      ),
    );
  }
}

