import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'export.dart';

void main() =>
    runApp(MaterialApp(
      theme:
      ThemeData(
          primaryColor:  Colors.lightBlue,
          accentColor: Colors.black12
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));