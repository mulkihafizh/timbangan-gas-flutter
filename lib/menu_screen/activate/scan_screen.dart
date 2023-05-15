import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _isScanned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon:
                Icon(Icons.arrow_back, color: Theme.of(context).primaryColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Scan QR',
            style:
                TextStyle(fontSize: 25, color: Theme.of(context).primaryColor)),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 180),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF212121)),
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width - 100,
                width: MediaQuery.of(context).size.width - 100,
                child: const Text(
                  'TAP',
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              if (_isScanned == false)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
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
                      setState(() {
                        _isScanned = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Device Activated!'),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Scan',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              if (_isScanned == true)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Nama Device',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'Timbangan Gas Lingkar',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'GUID',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            '0000000000000000000',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))),
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('Device Activated!'),
                                  ),
                                );
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
