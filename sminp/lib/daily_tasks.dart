import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'export.dart';

class DailyTasks extends StatefulWidget {
  @override
  _DailyTasksState createState() => _DailyTasksState();
}

class _DailyTasksState extends State<DailyTasks> {

  final items = List<String>.of(["Item 1", "Item 2"]);
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CheckboxListTile(
            title: Text("Checkbox1"),
            tristate: true,
            value: _checked,
            onChanged: (bool value) {
              setState(() {
                _checked = !_checked;
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'More options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Today Schedule'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Calendar()));
                }
            ),
            ListTile(
                leading: Icon(Icons.edit),
                title: Text('Weekly Schedule'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeeklyTasks()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
