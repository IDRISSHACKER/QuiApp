import 'package:flutter/material.dart';
import 'home.dart';

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>const MaterialApp(
    title: "QuizApp",
    debugShowCheckedModeBanner: false,
    home: Home(),
  );

}