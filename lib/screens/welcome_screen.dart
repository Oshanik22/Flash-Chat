import 'dart:math';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'file:///D:/FlutterProjects/flash-chat-flutter/lib/components/general_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const  String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation, animationColor;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,
    duration: Duration(seconds: 1),

    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animationColor = ColorTween(begin: Colors.blueGrey[900], end: Colors.white).animate(controller);
    animation.addStatusListener((status) {

    });
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationColor.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 500), totalRepeatCount: -1,
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            GeneralButton(text: 'Log In',
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },
              colour: kLoginButtonColor,
            ),
            GeneralButton(text: 'Register', onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            }, colour: kRegisterButtonColor)
          ],
        ),
      ),
    );
  }
}

