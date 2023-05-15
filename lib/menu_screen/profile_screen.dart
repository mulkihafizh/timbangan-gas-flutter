import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontFamily: 'Poppins', color: Color(0xFF212121), fontSize: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 70,
              ),
              Text(
                'Profile',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 70,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: const Text(
                    'Keluar',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const CircleAvatar(
                radius: 76,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 20),
              Text(
                'Someone Famous',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(children: [
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                    title: Text(
                      '0808080808',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                    title: Text(
                      'some1@gmail.com',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18),
                    ),
                  ),
                ])),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, right: 20, left: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              onPressed: () {
                Navigator.pushNamed(context, 'forgetPassword');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Ganti Password',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
