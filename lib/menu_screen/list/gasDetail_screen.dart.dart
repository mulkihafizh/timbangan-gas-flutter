import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GasDetailScreen extends StatefulWidget {
  final dynamic gasDetail;
  const GasDetailScreen({super.key, this.gasDetail});

  @override
  State<GasDetailScreen> createState() => _GasDetailScreenState();
}

class DayData {
  final String day;
  final num value;

  DayData({required this.day, required this.value});
}

class _GasDetailScreenState extends State<GasDetailScreen> {
  late DateTime _currentDateTime;
  late String _currentMonth;
  late String _currentDay;
  late String _currentHour;
  late String _currentMinute;
  late String _currentSecond;
  late String _currentYear;
  var _gasDetail;
  List<DayData> chartData = [];

  Future<void> deleteItemFromList(String guid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? existingData = prefs.getString('timbanganGas');
    final confirmed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete Device'),
        content: const Text('Are you sure you want to delete this device?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed) {
      if (existingData != null && existingData.isNotEmpty) {
        List<Map<String, dynamic>> gasList =
            List<Map<String, dynamic>>.from(jsonDecode(existingData));

        int indexToDelete = -1;

        for (int i = 0; i < gasList.length; i++) {
          if (gasList[i]['guid'] == guid) {
            indexToDelete = i;
            break;
          }
        }

        if (indexToDelete != -1) {
          gasList.removeAt(indexToDelete);
          await prefs.setString('timbanganGas', jsonEncode(gasList));
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, 'menu');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Device deleted'),
            ),
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _currentDateTime = DateTime.now();
    _currentMonth = _currentDateTime.month.toString().padLeft(2, '0');
    _currentDay = _currentDateTime.day.toString().padLeft(2, '0');
    _currentHour = _currentDateTime.hour.toString().padLeft(2, '0');
    _currentMinute = _currentDateTime.minute.toString().padLeft(2, '0');
    _currentSecond = _currentDateTime.second.toString().padLeft(2, '0');
    _currentYear = _currentDateTime.year.toString();
    _gasDetail = widget.gasDetail['penggunaan'];

    chartData = [
      DayData(day: 'Senin', value: _gasDetail['Sen']),
      DayData(day: 'Selasa', value: _gasDetail['Sel']),
      DayData(day: 'Rabu', value: _gasDetail['Rab']),
      DayData(day: 'Kamis', value: _gasDetail['Kam']),
      DayData(day: 'Jumat', value: _gasDetail['Jum']),
    ];
  }

  List<LineSeries<DayData, dynamic>> _createSeriesData() {
    return [
      LineSeries<DayData, dynamic>(
        dataSource: chartData,
        xValueMapper: (DayData data, _) => data.day,
        yValueMapper: (DayData data, _) => data.value,
        color: Colors.white,
        markerSettings: const MarkerSettings(
            color: Colors.blue, borderColor: Colors.blue, isVisible: true),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon:
                Icon(Icons.arrow_back, color: Theme.of(context).primaryColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Detail Device',
            style:
                TextStyle(fontSize: 25, color: Theme.of(context).primaryColor)),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
            fontFamily: 'Poppins', color: Color(0xFF212121), fontSize: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            right: 30,
            left: 30,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFF212121)))),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/gas2.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.gasDetail['name'],
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'GUID ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              widget.gasDetail['guid'].toString(),
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Routing key ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              '/tabung${widget.gasDetail['guid']}',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Status: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Aktif',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(children: [
                            const Text(
                              'TimeStamp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              '$_currentHour:$_currentMinute:$_currentSecond',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              '$_currentDay/$_currentMonth/$_currentYear',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '- 4.40 kg',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Power',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '22.00 W',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ]),
                        const SizedBox(height: 10),
                        Center(
                          child: Column(children: const [
                            Text(
                              'Device',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Timbangan Gas',
                              style: TextStyle(fontSize: 18),
                            ),
                          ]),
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          borderWidth: 0,
                          primaryYAxis: NumericAxis(
                            axisLine: const AxisLine(width: 0),
                            title: AxisTitle(
                                text: 'Jam',
                                textStyle: const TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                            maximum: 24,
                            labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF212121),
                                fontSize: 15),
                            minimum: 0,
                          ),
                          primaryXAxis: CategoryAxis(
                            axisLine: const AxisLine(width: 0),
                            title: AxisTitle(
                                text: 'Hari',
                                textStyle: const TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                            labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF212121),
                                fontSize: 15),
                          ),
                          series: _createSeriesData(),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).backgroundColor,
                    child: GestureDetector(
                      onTap: () {
                        deleteItemFromList(widget.gasDetail['guid']);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).primaryColor),
                            child: const Icon(Icons.delete_outline,
                                color: Colors.white, size: 40),
                          ),
                          const Text(
                            'Delete Device',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).backgroundColor,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('Wifi successfully reset'),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).primaryColor),
                            child: const Icon(Icons.wifi_rounded,
                                color: Colors.white, size: 40),
                          ),
                          const Text(
                            'Reset Wifi',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).backgroundColor,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('Delay successfully set'),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).primaryColor),
                            child: const Icon(Icons.history,
                                color: Colors.white, size: 40),
                          ),
                          const Text(
                            'Set Delay',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
