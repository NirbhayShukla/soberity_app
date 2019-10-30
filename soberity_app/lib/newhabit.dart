import 'package:flutter/material.dart';

class NewHabit extends StatefulWidget {
  @override
  _NewHabitState createState() => _NewHabitState();
}

class _NewHabitState extends State<NewHabit> {
  String name;
  String cost;
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

Widget prefixWidget(){
if(selected=="Money")
return Text("₹");
else
return Container(
  width: 0,
  height: 0,
);
}

Widget suffixWidget(){
if(selected=="Time")
return Text("hours");
else
return Container(
   width: 0,
  height: 0,
);
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
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text("What addiction or bad habit do you want to quit?",textAlign: TextAlign.center,),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400
                          )
                        ),
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
                        onChanged: (String value) {
                          cost = value;
                        },
                        onSubmitted: (String value) {
                          cost = value;
                        },
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center, 
                        cursorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          hintText: "Cost",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400
                          ),
                          prefix: prefixWidget(),
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          suffix: suffixWidget(),
                          suffixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RawMaterialButton(
                child: Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context,name);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                ),
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
