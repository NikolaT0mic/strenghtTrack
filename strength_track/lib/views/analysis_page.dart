import 'package:flutter/material.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {

  final _initialCalendarDate = DateTime.now();
  // final _dateFormat = DateFormat.yMMMMd();
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _initialCalendarDate;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.grey,
          ),
          CalendarDatePicker(
            initialDate: _initialCalendarDate,
            firstDate: _initialCalendarDate,
            lastDate: _initialCalendarDate.add(Duration(days: 30)),
            onDateChanged: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
          // Expanded(
          //   flex: 2,
          //   child: Placeholder(
          //     color: Colors.grey,
          //   ),
          // ),
          // Expanded(
          //   flex: 1,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
                // DropdownButton<String>(
                //   value: _selectedDropdownItem,
                //   items: _dropdownItems
                //       .map((item) => DropdownMenuItem(
                //     value: item,
                //     child: Text(item),
                //   ))
                //       .toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedDropdownItem = value;
                //     });
                //   },
                // ),
                // CalendarDatePicker(
                //   initialDate: _initialCalendarDate,
                //   firstDate: _initialCalendarDate,
                //   lastDate: _initialCalendarDate.add(Duration(days: 30)),
                //   onDateChanged: (date) {
                //     setState(() {
                //       _selectedDate = date;
                //     });
                //   },
                // ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
