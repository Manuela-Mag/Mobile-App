import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'export.dart';

//optimized to use one list for tasks
class Task{
  String taskName;
  int stressLevel;
  //DateTime time;
  String Day;
  bool mandatory;
  String description;
  Task(this.taskName, this.stressLevel);
}
//dictionary used for storing stress level and task's name for each day
HashMap dictionary = new HashMap<String, Task>();//key->day, value->instance of class Task
List<Task> tasks = List<Task>();
//initialize the keys of the dictionary
HashMap dictionary1 = {'Monday': null, 'Tuesday': null, 'Wednesday': null, 'Thursday': null, 'Friday': null, 'Saturday': null, 'Sunday':null} as HashMap;

//second screen ->schedule
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    final List<Color> colorCodes = <Color>[Colors.lightBlue, Colors.cyan,
      Colors.teal, Colors.green, Colors.lightGreen, Colors.lime, Colors.yellow,
      Colors.orange, Colors.deepOrange, Colors.red];
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: tasks.length,
        itemBuilder: (context, index) {

          final item = tasks[index];
          return Dismissible(
            key: Key(item.taskName),
            onDismissed: (direction){
              setState(() {
                tasks.removeAt(index);
              });
            },
            child: Container(decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: colorCodes[tasks[index].stressLevel % (colorCodes.length + 1) - 1],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))
            ),
              height: 70,
              child: Center(child: Text('${tasks[index].taskName}')),
            ),
            background: Container(
              color: Colors.red,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          final nameController = TextEditingController();
          final dayNameController = TextEditingController();
          return showDialog(context: context, builder:(dialogContext) {
            return AlertDialog(
                title : Text("Input the Stress Level "),
                content: Column(
                    children:[
                      TextField(
                        decoration: new InputDecoration(
                          labelText: "Enter task: ",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                            ),
                          ),
                        ),
                        controller: nameController,
                      ),
                      TextField(
                          decoration: new InputDecoration(
                            labelText: "Stress Level",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          //   controller: new TextEditingController(),
                          onSubmitted: (text) {
                            setState(() {
                              final activeTask = Task(nameController.text,
                                  int.parse(text));
                              tasks.add(activeTask);
                              eCtrl.clear();
                            });
                            Navigator.of(context).pop();
                          }
                      ),
                      TextField(
                          decoration: new InputDecoration(
                            labelText: "Day",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                            ),
                            ),
                            ),
                            controller: dayNameController,
                      )]

                )
            );

          });
        },

        backgroundColor: Colors.blue,
        tooltip: 'Add to schedule',
        child: new Icon(Icons.add),
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
                title: Text('Calendar'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeeklyTasks()));
                }
            ),
            ListTile(
                leading: Icon(Icons.edit),
                title: Text('Daily Tasks'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DailyTasks()));
                }
            ),
          ],
        ),
      ),
    );
  }

  addValueToDictionary(TextEditingController nameController) {
    if(tasks.isNotEmpty)
      for (var i in tasks){
        if(dictionary.containsKey(i.Day)){
          dictionary.putIfAbsent(i.Day, () => i);
        }
        else{
          dictionary.putIfAbsent(i.Day, () => i);
        }
      }
    for ( d in di)
  }
}