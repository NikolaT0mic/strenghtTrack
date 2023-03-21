import 'package:flutter/material.dart';
import 'package:strength_track/views/training/current_training_page.dart';

import '../styles/text_styles.dart';
import 'common.dart';

class TrainingPlan extends StatelessWidget {
  const TrainingPlan({Key? key, required this.name, required this.exNum}) : super(key: key);

  final String name;
  final int exNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CurrentTrainingPage(name: "Back A"),)
        ),
        child: SizedBox(
          // margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 12,
          child: DecoratedBox(
            decoration: standardBoxdecoration,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: trainingPlansNameStyle),
                  Text("$exNum Exercises", style: trainingPlansExNumStyle)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
