import 'package:flutter/material.dart';

import './data.dart';
import './overview.dart';
import './statistics.dart';

class Habitdetails extends StatelessWidget {
  final Data habit;

  Habitdetails(this.habit);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(habit.name,
              style: TextStyle(fontFamily: 'Milkshake', fontSize: 25)),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Statistics",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[Overview(habit), Statistics(habit)],
        ),
      ),
    );
  }
}
