import 'package:flutter/material.dart';

class NewHabit extends StatefulWidget {
  @override
  _NewHabitState createState() => _NewHabitState();
}

class _NewHabitState extends State<NewHabit> {
  String name;
  String selected;
  List<String> menuitems = ["Event", "Money", "Time"];
  List<DropdownMenuItem<String>> menu = [];
  int itemselected = 0;

  List<DropdownMenuItem<String>> getmenu() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in menuitems) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  @override
  void initState() {
    menu = getmenu();
    selected = menu[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Commit to Quit",
          style: TextStyle(fontFamily: 'Milkshake', fontSize: 25),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
          child: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Text("What addiction or bad habit do you want to quit?"),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                TextField(
                  onChanged: (String value) {
                    name = value;
                  },
                  onSubmitted: (String value) {
                    name = value;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text("What does this habit cost you?"),
                DropdownButton(
                  value: selected,
                  items: menu,
                  onChanged: (String value) {
                    selected = value;

                    setState(() {});
                  },
                ),
                TextField(

                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          RawMaterialButton(
            child: Text("Done",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            onPressed: (){
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),),
        fillColor: Colors.redAccent,
        constraints: BoxConstraints(
                        minHeight: 50,
                        minWidth: double.infinity,
                      ),
          ),
        ],
      )),
    );
  }
}
