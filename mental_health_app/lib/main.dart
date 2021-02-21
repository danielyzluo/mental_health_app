import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_mentor.dart';
import 'screens/login_screen.dart';
import 'screens/login_success.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        LoginMentor.id: (context) => LoginMentor(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginSuccess.id: (context) => LoginSuccess(),
      },
    );
  }
}
