import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: DefaultTextStyle(
          style: const TextStyle(
              fontFamily: 'Poppins', color: Color(0xFF212121), fontSize: 25),
          child: Container(
              padding: const EdgeInsets.only(
                  top: 70, right: 30, left: 30, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Timbangan Gas',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/gas.png',
                        height: 220,
                        width: 220,
                      ),
                      const SizedBox(height: 10),
                      const Text('Login',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          )),
                      const SizedBox(height: 20),
                      TextField(
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          labelText: 'Email',
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF212121)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF212121)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: obscureText,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            color: Theme.of(context).primaryColor,
                            icon: obscureText
                                ? const Icon(
                                    Icons.visibility,
                                  )
                                : const Icon(Icons.visibility_off),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF212121)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF212121)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: GestureDetector(
                                onTap: () => {
                                      Navigator.pushNamed(
                                          context, 'forgetPassword')
                                    },
                                child: Text(
                                  textAlign: TextAlign.right,
                                  'Lupa Password?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'menu');
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              ' Disini!',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              )),
        ));
  }
}
