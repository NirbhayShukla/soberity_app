import 'package:flutter/material.dart';
import 'dart:async';

import './newhabit.dart';
import './data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Data> _habits = [];

  Widget HabitList() {
    if (_habits.length > 0)
      return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: _habits
              .map((habit) => RawMaterialButton(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    elevation: 20,
                    fillColor: Colors.grey,
                    child: Text(habit.name),
                    onPressed: () {},
                  ))
              .toList(),
        ),
      );
    else
      return Container(
        width: 0,
        height: 0,
      );
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
        titleSpacing: 0,
        leading: Icon(Icons.mood),
        actions: <Widget>[
          RawMaterialButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => NewHabit(),
                ),
              ) as Data;
              if (result.name != null) {
                _habits.add(result);
              }
              setState(() {});
            },
            constraints: BoxConstraints(maxWidth: 50),
          ),
          RawMaterialButton(
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {},
            constraints: BoxConstraints(maxWidth: 50),
          )
        ],
      ),
      body: HabitList(),
    );
  }
}
