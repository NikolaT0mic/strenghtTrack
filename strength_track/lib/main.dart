import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:strength_track/views/exercise/exercises_page.dart';
import 'package:strength_track/views/not_implemented_page.dart';
import 'package:strength_track/views/weight/weight_log_page.dart';
import 'views/training/training_plans_page.dart';
import 'views/analysis_page.dart';
import 'widgets/common.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const StrengthTrackApp());
}

class StrengthTrackApp extends StatelessWidget {
  const StrengthTrackApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Strength Track'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  final _pageOptions = [TrainingPlansPage(), ExercisePage(), AnalysisPage(), NotImplementedPage(), WeightLogPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppbar,
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trainings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Übungen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analyse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Weightlog',
          ),
        ],
      )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: <Widget>[
      //     TrainingPlansPage()
      //   ],
      // ),
    );
  }
}
