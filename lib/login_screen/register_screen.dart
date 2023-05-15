import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      const Text('Sign Up',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          )),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          labelText: 'Nama',
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
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          labelText: 'Nomor Telepon',
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
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          labelText: 'Regist Code',
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
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
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
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
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
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Sign Up',
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
                        Navigator.pop(context);
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Login',
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
