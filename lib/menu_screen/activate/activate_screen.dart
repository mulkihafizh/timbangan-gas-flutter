import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({super.key});

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  List<Map<String, dynamic>> gasList = [];
  String _name = '';
  String _guid = '';
  final _guidField = TextEditingController();
  final _nameField = TextEditingController();
  List randomNumber = [];
  var addData;

  List<int> generateRandomNumbers(int count) {
    Random random = Random();
    List<int> randomNumbers = [];

    for (int i = 0; i < count; i++) {
      int randomNumber = random.nextInt(24) + 1;
      randomNumbers.add(randomNumber);
    }

    return randomNumbers;
  }

  @override
  void initState() {
    super.initState();
  }

  void _storeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var newData = prefs.getString('timbanganGas');
    List<Map<String, dynamic>> convertedData =
        List<Map<String, dynamic>>.from(jsonDecode(newData ?? "[]"));
    prefs.clear;

    setState(() {
      randomNumber = generateRandomNumbers(5);
    });
    gasList = convertedData;

    if (_guidField.text.isEmpty || _nameField.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Nama dan GUID tidak boleh kosong!'),
        ),
      );
      return;
    }
    addData = {
      "name": _name,
      "guid": _guid,
      "penggunaan": {
        "Sen": randomNumber[0],
        "Sel": randomNumber[1],
        "Rab": randomNumber[2],
        "Kam": randomNumber[3],
        "Jum": randomNumber[4]
      }
    };

    gasList.add(addData);
    var stringData = jsonEncode(gasList);
    await prefs.setString('timbanganGas', stringData);

    _nameField.clear();
    _guidField.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _name = '';
      _guid = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Device Activated!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          color: Color(0xFF212121), fontSize: 25, fontFamily: 'Poppins'),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              Text(
                'Timbangan Gas',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScanScreen();
                  }));
                },
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/gas.png',
            height: 220,
            width: 220,
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(children: [
                const Text('Activate Device', style: TextStyle(fontSize: 25)),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  controller: _nameField,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Nama Device',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _guid = value;
                    });
                  },
                  controller: _guidField,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'GUID',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: GestureDetector(
                          onTap: () => {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const ScanScreen();
                                }))
                              },
                          child: Row(
                            children: [
                              const Text(
                                textAlign: TextAlign.right,
                                'Scan',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF212121),
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.right,
                                ' Disini!',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                    onPressed: () {
                      _storeData();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Activate',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
