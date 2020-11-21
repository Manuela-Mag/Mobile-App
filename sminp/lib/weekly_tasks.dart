import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Weekly Tasks
class WeeklyTasks extends StatefulWidget
{
  @override
  _WeeklyTasksState createState() => _WeeklyTasksState();
}

class _WeeklyTasksState extends State<WeeklyTasks> {

  final List<String> entries = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<int> colorCodes = <int>[100, 200, 300, 400, 500, 600, 700];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration : new BoxDecoration(
                  color: Colors.blue[colorCodes[index]],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0))
              ),
              height: 80,
              child: Center(child: Text('${entries[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          //TODO ADD THE FUCKING DRAWER MORONS
        )
    );
  }
}