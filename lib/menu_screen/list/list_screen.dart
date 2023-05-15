import 'package:flutter/material.dart';
import 'package:timbangan_gas/menu_screen/list/gasDetail_screen.dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Map<String, dynamic>> gasList = [];

  void _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var rawData = prefs.getString('timbanganGas');

    List<Map<String, dynamic>> convertedData =
        List<Map<String, dynamic>>.from(jsonDecode(rawData ?? "[]"));

    setState(() {
      gasList = convertedData;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontFamily: 'Poppins', color: Color(0xFF212121), fontSize: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
        child: Column(children: [
          Text(
            'List Device',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 2.5,
            color: Theme.of(context).primaryColor,
          ),
          if (gasList.isEmpty)
            const Expanded(child: Center(child: Text('Data Kosong'))),
          if (gasList.isNotEmpty)
            Expanded(
                child: ListView.builder(
              itemCount: gasList.length,
              itemBuilder: (context, index) {
                var gasItem = gasList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GasDetailScreen(
                                  gasDetail: gasItem,
                                )));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Image.asset(
                                  'assets/images/gas2.png',
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    gasItem['name'],
                                    style: const TextStyle(
                                      fontSize: 21,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'Tap Untuk',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        ' Detail',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
        ]),
      ),
    );
  }
}
