import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:strength_track/datatypes/datatypes.dart';
import 'package:strength_track/widgets/common.dart';


class WeightLogPage extends StatefulWidget {
  const WeightLogPage({Key? key}) : super(key: key);

  @override
  State<WeightLogPage> createState() => _WeightLogPageState();
}

class _WeightLogPageState extends State<WeightLogPage> {

  late double weight;
  late DateTime date;

  bool weightSet = false;
  bool dateSet = false;

  late final Future<Box> testBox;

  @override
  void initState() {
    testBox = Hive.openBox("test");
    super.initState();
  }

  @override
  void dispose() {
    Hive.box("test").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/3,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: "Gewicht Eingeben",
                        border: OutlineInputBorder(),
                      ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      double? input = double.tryParse(value);
                      // Do something with the input value
                      print(input);
                      if(input!=null) {
                        weightSet = true;
                        weight = input;
                      }
                    },
                  ),
                ),
                SizedBox(width: 20,),
                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          maxTime: DateTime.now(), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            dateSet = true;
                            this.date = date;
                          }, currentTime: DateTime.now());
                    },
                    child: Text(
                      'Tag auswählen',
                      style: TextStyle(color: Colors.blue),
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: testBox,
                builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                    ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        Center(child: CircularProgressIndicator())
                      ],
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      var dat = snapshot.data.get(0).toString();
                      // print(jsonDecode(dat));
                      return Column(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              child: returnWeightLogList(snapshot.data)),
                          TextButton(
                              onPressed: () => {
                                snapshot.data.add(WeightLog(weight, date).toJson())
                              },
                              child: Text("Test")),
                        ],
                      );
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView returnWeightLogList(Box data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final WeightLog log = WeightLog.fromJson(new Map<String, dynamic>.from(data.get(index)));
        return WeightLogWidget(weight: log.weight, date: log.date);
      },
    );
  }
}

class WeightLogWidget extends StatelessWidget {
  final DateTime date;
  final double weight;

  const WeightLogWidget({Key? key, required this.weight, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: standardBoxdecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Gewicht: ${weight}"),
              SizedBox(width: 15,),
              Text("Tag ${date.toString()}")
            ],
          ),
        ),
      ),
    );
  }
}
