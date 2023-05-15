import 'package:flutter/material.dart';
import 'splash_screen/splash_screen.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/register_screen.dart';
import 'login_screen/forget_password_screen.dart';
import 'menu_screen/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF658864),
        backgroundColor: const Color(0xFFB7B78A),
        textTheme: (const TextTheme(
          bodyText1: TextStyle(color: Color(0xFF212121)),
        )),
      ),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
        'forgetPassword': (context) => const ForgetPasswordScreen(),
        'menu': (context) => const MenuScreen(),
      },
    );
  }
}
