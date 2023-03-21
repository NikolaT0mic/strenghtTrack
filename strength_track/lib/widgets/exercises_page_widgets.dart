import 'package:flutter/material.dart';
import 'package:strength_track/views/exercise/exercise_config_page.dart';

import '../styles/text_styles.dart';
import 'common.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 12,
      decoration: standardBoxdecoration,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExerciseConfigurationPage(name: this.name,),)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// TODO add style for this
            Text(name, style: trainingPlansNameStyle),
          ],
        ),
      ),
    );
  }
}
