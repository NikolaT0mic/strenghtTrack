import 'package:flutter/material.dart';
import 'package:strength_track/widgets/common.dart';

import '../../styles/text_styles.dart';

class ExerciseConfigurationPage extends StatefulWidget {
  final String name;

  const ExerciseConfigurationPage({Key? key, required this.name}) : super(key: key);

  @override
  State<ExerciseConfigurationPage> createState() => _ExerciseConfigurationPageState();
}

class _ExerciseConfigurationPageState extends State<ExerciseConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExerciseToConfigure(name: widget.name)
          ],
        ),
      ),
    );
  }
}

class ExerciseToConfigure extends StatefulWidget {
  const ExerciseToConfigure({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<ExerciseToConfigure> createState() => _ExerciseToConfigState();
}

class _ExerciseToConfigState extends State<ExerciseToConfigure> {

  String _selectedOption1 = "Langhantel";
  String _selectedOption2 = "Option 1";
  String _selectedOption3 = "Option 1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: standardBoxdecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Flexible(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(widget.name, style: bigSizeStyle)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text("Primärer muskel: Brust", style: midSizeStyle),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text("Sekundärer muskel: Brust", style: midSizeStyle),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Wrap(
                    children: [
                      Row(
                        children: [
                          Text("Griffart: ", style: midSizeStyle),
                          SizedBox(width: 5,),
                          DropdownButton<String>(
                            hint: Text('Select an option'),
                            value: _selectedOption1,
                            items: [
                              DropdownMenuItem(
                                value: 'Langhantel',
                                child: Text('Langhantel'),
                              ),
                              DropdownMenuItem(
                                value: 'Kurzhantel',
                                child: Text('Kurzhantel'),
                              ),
                              DropdownMenuItem(
                                value: 'Multipresse',
                                child: Text('Multipresse'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption1 = value!;
                              });
                            },
                            elevation: 2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Sitzwinkel: ", style: midSizeStyle),
                          SizedBox(width: 5,),
                          DropdownButton<String>(
                            hint: Text('Select an option'),
                            value: _selectedOption2,
                            items: [
                              DropdownMenuItem(
                                value: 'Option 1',
                                child: Text('Option 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Option 2',
                                child: Text('Option 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Option 3',
                                child: Text('Option 3'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption2 = value!;
                              });
                            },
                            elevation: 2,
                          ),
                        ],
                      ),
                      DropdownButton<String>(
                        hint: Text('Select an option'),
                        value: _selectedOption3,
                        items: [
                          DropdownMenuItem(
                            value: 'Option 1',
                            child: Text('Option 1'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 3',
                            child: Text('Option 3'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _selectedOption3 = value!;
                          });
                        },
                        elevation: 2,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
