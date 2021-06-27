import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        WelcomeScreen.id   : (context) => WelcomeScreen(),
        ChatScreen.id  : (context) => ChatScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen()
      },
    );
  }
}
