import 'package:flutter/material.dart';

import 'index.dart';

void main() 
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: Color(0xff202c3b),
    ),
    home: Index(),

    routes: 
    {
      Index.routename:(ctx) => Index(),
      
    },
  ));
}