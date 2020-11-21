import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'export.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Calendar())));
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child:Center(
              child: Image(
                image: NetworkImage('https://scontent.ftsr1-2.fna.fbcdn.net/v/t1.15752-0/p280x280/126321630_852205475528434_7929098438498669560_n.png?_nc_cat=109&ccb=2&_nc_sid=ae9488&_nc_ohc=ETxDYRhO6s0AX_JjmGs&_nc_ht=scontent.ftsr1-2.fna&oh=70dff0764ede876529e45c9ab2bf5b23&oe=5FDBD279'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.blue[300],
                          radius: 50.0,
                          child: Icon(
                            Icons.done_all_sharp,
                            color: Colors.deepPurple[100],
                            size: 50.0,
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(top:10.0),
                        ),
                        Text(
                          "Stress Management is No Problem",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 18.0,
                              fontWeight:  FontWeight.bold,
                              fontStyle: FontStyle.italic
                          ),
                        )
                      ],
                    )
                ),
              ),
              Expanded(
                  flex:1,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue)
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                          "Loading...",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}