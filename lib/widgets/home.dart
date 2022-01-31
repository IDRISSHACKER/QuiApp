import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'page_quiz.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_Home();
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      title: const Text("QuizDev"),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            elevation: 10.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset("assets/2.png",
                fit: BoxFit.cover,),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PageQuiz()));
              },
              child: CustomTest("Commencer le test", color: Colors.white)
          )
        ],
      ),
    ),
  );

}