import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int questionNumber = 0;
  int score=0;
  bool showScore = false;
  List<Icon> scoreKeeper = [];
  List<Map<dynamic, dynamic>> questions = [
    {
      'statement':
          'Cyclones spin in a clockwise direction in the southern hemisphere',
      'answer': true
    },
    {
      'statement': 'Goldfish only have a memory of three seconds',
      'answer': false
    },
    {
      'statement': 'The Channel Tunnel is the longest rail tunnel in the world',
      'answer': false
    },
    {'statement': 'The first tea bags were made of silk', 'answer': true},
    {'statement': 'A woman has walked on the moon', 'answer': false},
    {
      'statement': 'The Statue of Liberty was a gift from France',
      'answer': true
    },
    {
      'statement':'Chocolate can be lethal to dogs.',
      'answer':true
    },
    {
      'statement':'Brazil has won more World Cup (soccer) championships than any other country.',
      'answer':true
    }
    ,{
    'statement':'"Magma" is the scientific name for lava.',
      'answer':false
    },
    {
      'statement':'The blue whale, the world\'s largest animal, has teeth 12 inches long.',
      'answer':false
    }
  ];
  void reset() {
    setState(() {
      showScore=false;
      score=0;
      questionNumber = 0;
      scoreKeeper = [];
    });
  }
  void updateScoreKeeper(ans) {
    setState(() {
      if (questions[questionNumber]['answer'] == ans) {
        score++;
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (++questionNumber == questions.length) {
        setState(() {
          showScore = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(backgroundColor: Colors.grey.shade900),
      body: showScore
          ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('YOUR SCORE: $score out of 10',style:Theme.of(context).textTheme.display1,),
                  FlatButton(child: Text('Play Again',style: Theme.of(context).textTheme.display1,),
                      onPressed: () => reset())
                ],
              ),
          )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        questions[questionNumber]['statement'],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () => updateScoreKeeper(true),
                        child: Container(
                          child: Center(
                            child: Text(
                              'True',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                          height: 100,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () => updateScoreKeeper(false),
                        child: Container(
                          child: Center(
                            child: Text(
                              'False',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                          height: 100,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: Row(
                    children: scoreKeeper,
                  ),
                )
              ],
            ),
    );
  }
}
