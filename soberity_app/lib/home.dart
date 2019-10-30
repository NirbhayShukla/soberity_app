import 'package:flutter/material.dart';

import './newhabit.dart';

class Home extends StatefulWidget {
  String habit = "";
  Home();
  Home.addHabit(this.habit);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _habits = [];

  @override
  void initState() {
    _habits.add(widget.habit);
    super.initState();
  }

  Widget HabitList(){
    if(_habits.length>0)
    return ListView(
        children: _habits
            .map((habit) => Card(
                  child: Text(habit),
                ))
            .toList(),
      );
      else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soberity',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Milkshake',
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => NewHabit(),
                  ));
            },
          ),
          FlatButton(
            child: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: HabitList(),
    );
  }
}
