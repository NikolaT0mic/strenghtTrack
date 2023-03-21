import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strength_track/datatypes/datatypes.dart';
import 'package:strength_track/widgets/exercises_page_widgets.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {

  late Future<List<Exercise>> exercisesList;

  Future<List<Exercise>> parseExercises() async {
    final excercises = await rootBundle.loadString('assets/example_exercise_data.json');
    final parsed = jsonDecode(excercises);
    print(parsed);
    // excercisesList = parsed.map<Excercise>((json) => Excercise.fromJson(json)).toList();
    return List<Exercise>.from(parsed.map((i) => Exercise.fromJson(i)));
  }

  @override
  void initState() {
    exercisesList = parseExercises();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: [
            Chip(label: Text('Brust'),),
            Chip(label: Text('Schultern')),
            Chip(label: Text('Rücken')),
            Chip(label: Text('Arme')),
            Chip(label: Text('Beine')),
          ],
        ),
        FutureBuilder<List<Exercise>>(
          future: exercisesList,
          builder: (
              BuildContext context,
              AsyncSnapshot<List<Exercise>> snapshot,
              ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!.map((e) => ExerciseWidget(name: e.name)).toList(),
                );
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        )
      ] ,
    );
  }
}
