import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';
import '../../widgets/common.dart';

class CurrentTrainingPage extends StatefulWidget {
  const CurrentTrainingPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<CurrentTrainingPage> createState() => _CurrentTrainingPageState();
}

class _CurrentTrainingPageState extends State<CurrentTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurrentExercise(name: "Bench")
          ],
        ),
      ),
    );
  }
}

class CurrentExercise extends StatefulWidget {
  const CurrentExercise({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<CurrentExercise> createState() => _CurrentExerciseState();
}

class _CurrentExerciseState extends State<CurrentExercise> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: standardBoxdecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(widget.name, style: midSizeStyle)),
              DataTable(
                  columns: [
                    DataColumn(label: Text('Satz')),
                    DataColumn(label: Text('kg')),
                    DataColumn(label: Text('Wdh.'))
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('80')),
                      DataCell(Text('12'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('80')),
                      DataCell(Text('12'))
                    ])
                  ])
            ],
          ),
        )
      ),
    );
  }
}
