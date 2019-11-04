import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';
import 'package:soberity_app/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import './newhabit.dart';
import './data.dart';
import './habitdetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Data> _habits = [];
  int count = 0;
  DataBaseHelper dbhelper = DataBaseHelper();

  Widget abstinenceTime(DateTime lastinteraction) {
    DateTime current = DateTime.now();
    Duration abstime = current.difference(lastinteraction);
    int finalresult = abstime.inHours;
    return Text(
      "$finalresult hours",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget progressbar(DateTime lastinteraction) {
    DateTime current = DateTime.now();
    Duration abstime = current.difference(lastinteraction);
    int finalresult = abstime.inHours;
    double barprogress = finalresult / 720;
    var percent = (barprogress * 100).toStringAsFixed(2);
    return CircularPercentIndicator(
      radius: 85.0,
      lineWidth: 8.0,
      percent: barprogress,
      center: new Text(
        "$percent%",
        style: TextStyle(
          fontSize: 15,
          color: Colors.redAccent,
        ),
      ),
      animation: true,
      animationDuration: 1200,
      progressColor: Colors.redAccent,
      backgroundColor: Colors.grey[200],
      footer: new Text(
        "30 DAYS",
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }

  Widget habitList() {
    if (_habits.length > 0)
      return Column(
        children: _habits
            .map(
              (habit) => Padding(
                padding: EdgeInsets.all(6),
                child: RawMaterialButton(
                  padding: EdgeInsets.all(15),
                  constraints:
                      BoxConstraints(minWidth: double.infinity, minHeight: 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Habitdetails(habit)));
                  },
                  fillColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            habit.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                          ),
                          Text(
                            "Abstinence Time",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          abstinenceTime(habit.lastinteraction)
                        ],
                      ),
                      progressbar(habit.lastinteraction),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
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
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            Container(
              constraints:
                  BoxConstraints(minHeight: 50, minWidth: double.infinity),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "I commit to quit :",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            habitList(),
          ],
        ),
      ),
    );
  }
}
