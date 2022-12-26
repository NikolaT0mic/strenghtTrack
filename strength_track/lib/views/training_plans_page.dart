import 'package:flutter/material.dart';

import '../styles/text_styles.dart';
import '../widgets/training_plans_page_widgets.dart';

class TrainingPlansPage extends StatefulWidget {
  const TrainingPlansPage({Key? key}) : super(key: key);

  @override
  State<TrainingPlansPage> createState() => _TrainingPlansPageState();
}

class _TrainingPlansPageState extends State<TrainingPlansPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrainingPlan(name: "Back Day A", exNum: 6),
        TrainingPlan(name: "Back Day B", exNum: 6),
        TrainingPlan(name: "Chest", exNum: 8),
        TrainingPlan(name: "Legs", exNum: 9),
      ],
    );
  }
}
