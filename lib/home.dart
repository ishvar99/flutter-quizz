import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  'This is where question text will go out',
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
                  onPressed: () => print('true'),
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
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Icon(Icons.close, color: Colors.red)
              ],
            ),
          )
        ],
      ),
    );
  }
}
