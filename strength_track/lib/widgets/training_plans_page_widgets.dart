import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class TrainingPlan extends StatelessWidget {
  const TrainingPlan({Key? key, required this.name, required this.exNum}) : super(key: key);

  final String name;
  final int exNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.grey[700]!, width: 3),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: trainingPlansNameStyle),
          Text("$exNum Exercises", style: trainingPlansExNumStyle)
        ],
      ),
    );
  }
}
