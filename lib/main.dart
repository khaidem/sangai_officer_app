import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white24,
    statusBarIconBrightness: Brightness.dark,

    //or set color with: Color(0xFF0000FF)
  ));
  runApp(const MyApp());
}
