import 'package:flutter/material.dart';
import 'package:timbangan_gas/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/gas.png',
              width: 220,
              height: 220,
            ),
            const SizedBox(height: 20),
            Text(
              'Timbangan Gas',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
