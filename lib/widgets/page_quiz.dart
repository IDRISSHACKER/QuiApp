import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:quiz/models/Question.dart';

class PageQuiz extends StatefulWidget{

  @override
  _PageQuiz createState()=>_PageQuiz();

}

class _PageQuiz extends State<PageQuiz>{

  late Question question;

  List<Question> listQuestions = [
    Question(
        "Le Java est le meilleure language de programmation",
        false,
        "Il n'existe pas de meilleure language de programmation, chaque language resout une problematique",
        "assets/1.jpg"
    ),
  Question(
      " Le fondateur de TESLA et de SPACE X est JEFT BEZOS",
      false,
      "Tesla et SpaceX entreprises revolutionnaire ont été fondé par ELON Musk et JEFT BEZOS ets le fondateur D'amazon",
      "assets/2.png"
  ),
  Question(
      "Qithub est un gestionnaire de versionnage de code",
      true,
      "Github permet de versionner le code de travailler à distance et de faire du télétravail",
      "assets/3.png"
  )
  ];

  int index =  0;
  int score = 0;

  @override
  void initState(){
    super.initState();
    question = listQuestions[index];
  }

  @override
  Widget build(context){
    double size = MediaQuery.of(context).size.width * 0.75;
    return Scaffold(
    appBar: AppBar(
      title: CustomTest("Question", color: Colors.white,),
    ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomTest('Question Numero ${index+1}', color: Colors.black54,),
            CustomTest('Score: $score / $index', color: Colors.black54,),
            Card(
              elevation: 10.0,
              child: SizedBox(
                height: size,
                width: size,
                child: Image.asset(question.img, fit: BoxFit.cover,),
              ),
            ),
            CustomTest(question.question+" ?", color: Colors.black38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonBool(true),
                buttonBool(false)
              ],
            )
          ],
        ),
    ),
  );
  }

  Future<void> dialog(bool b) async{
    bool correctAnswer = (b == question.reponse);
    String correct = "assets/true.svg";
    String noCorrect = "assets/false.svg";

    (correctAnswer) ? setState(()=>score+=1) : score+= 0;
      
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return SimpleDialog(
            title: CustomTest((correctAnswer) ? "Reponse correct ! " : "Oups ! perdu...", color: (correctAnswer) ? Colors.green : Colors.red,),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              Image.asset((correctAnswer) ? correct : noCorrect, fit: BoxFit.cover,),
              SizedBox(height: 25.0,),
              CustomTest(question.explication, factor: 1.4, color: Colors.black38,),
              SizedBox(height: 25.0,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    lastQuestion();
                  },
                  child: CustomTest("Au suivant", color: Colors.white, factor: 1.25,))
            ],
          );
        }
      );
    }

  ElevatedButton buttonBool(bool b){
    return ElevatedButton(
        onPressed: (()=>dialog(b)),
        child: CustomTest((b) ? "Vrai" : "Faux", color: Colors.white,)
    );
  }

  void lastQuestion(){
    index++;
    if(index < listQuestions.length) {
      setState((){
        question = listQuestions[index];
      });
    }else{
      alert();
    }
  }

  Future<Null> alert() async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: CustomTest("Fin du Quiz !", factor: 1.3,),
            contentPadding: EdgeInsets.all(10.0),
            content: CustomTest("Votre score : $score / $index"),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: ((){
                    Navigator.pop(buildContext);
                    Navigator.pop(context);
                  }),
                  child: CustomTest("Terminer", color: Colors.white,)
              )
            ],
          );
        }
    );
  }
}