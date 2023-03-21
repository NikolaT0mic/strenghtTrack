enum MuscleGroup{
  Brust,
  Ruecken,
  Schultern,
  Arme, /// TODO vielleicht bizeps trizeps
  Beine,
  Rumpf
}

// class Exercise {
//   var name;
//   var dropdowns;
//   var tags;
//   var category;
// }

class TrainingsLog {
  var trainingPlan;
  var exerciseList;
  var date;
}

class ExerciseLog {
  var exercise;
  var sets;
}

class SetLog {
  var weight;
  var reps;
}

class WeightLog {
  double weight;
  DateTime date;

  WeightLog(this.weight, this.date);

  WeightLog.fromJson(Map<String, dynamic> json)
      : weight = json['weight'],
        date = json['date'];

  Map<String, dynamic> toJson() =>
      {
        'weight': weight,
        'date': date
      };
}

class Exercise {
  final String name;
  final String mainMuscle;
  final List dropdowns;
  final String category;

  Exercise(this.name, this.mainMuscle, this.dropdowns,
      this.category);

  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        mainMuscle = json['mainMuscle'],
        dropdowns = json['dropdowns'],
        category = json['category'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'mainMuscle': mainMuscle,
    'dropdowns': dropdowns,
    'category': category,
  };
}

class Training {
  final String name;
  final List<Exercise> exerciseList;

  Training(this.name, this.exerciseList);

  Training.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        exerciseList = json['excerciseList'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'excerciseList': exerciseList,
  };
}