import 'package:flutter/material.dart';

import './newhabit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _habits = [];

  Widget HabitList() {
    if (_habits.length > 0)
      return Container(
        padding: EdgeInsets.all(10),
        child:ListView(
        children: _habits
            .map((habit) => RawMaterialButton(
                  child: Text(habit),
                  onPressed: (){},
                ))
            .toList(),
      ),);
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
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => NewHabit(),
                  ));
                   _habits.add(result);
                  setState(() {
                  
                  });
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
