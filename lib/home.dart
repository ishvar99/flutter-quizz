import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int questionNumber=0;
  List<Icon> scoreKeeper = [];
  List<Map<dynamic,dynamic>> questions=[
  {'statement':'Cyclones spin in a clockwise direction in the southern hemisphere','answer':true},
{'statement':'Goldfish only have a memory of three seconds','answer':false},
{'statement':'The Channel Tunnel is the longest rail tunnel in the world','answer':false},
    {'statement':'The first tea bags were made of silk','answer':true},
{'statement':'A woman has walked on the moon','answer':false},
{'statement':'The Statue of Liberty was a gift from France','answer':true}
  ];
  void reset()
  {
    setState(() {
      questionNumber=0;
      scoreKeeper=[];
    });
  }
  void updateScoreKeeper(ans){
    setState(() {
      if(questions[questionNumber]['answer']==ans) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      }
      else{
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if(++questionNumber==questions.length)
        reset();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(backgroundColor: Colors.grey.shade900),
      body: Column(
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
                  onPressed: ()=>updateScoreKeeper(true),
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
                  onPressed: ()=> updateScoreKeeper(false),
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
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Row(
              children: scoreKeeper,
            ),
          )
        ],
      ),
    );
  }
}
