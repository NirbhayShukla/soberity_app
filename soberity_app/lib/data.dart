class Data {
  String name;
  double cost;
  bool money;
  DateTime quitdate;
  DateTime lastinteraction;
  Duration maxabstinenceperiod;
  Duration minabstinenceperiod;
  Duration previousabstinenceperiod;
  int resets;
  double spent;
  Data({this.name, this.cost, this.lastinteraction}) {
    quitdate = DateTime.now();
    maxabstinenceperiod = null;
    minabstinenceperiod = null;
    previousabstinenceperiod = null;
    resets = 0;
    spent = 0;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (name != null) {
      map['name'] = name;
    }
   map['cost']=cost;
   map['money']=money;
   map['quitdate']=quitdate;
   map['lastinteraction']=lastinteraction;
   map['minabstinenceperiod']=minabstinenceperiod;
   map['maxabstinenceperiod']=maxabstinenceperiod;
   map['previousabstinenceperiod']=previousabstinenceperiod;
   map['resets']=resets;
   map['spent']=spent;

    return map;
  }

  Data.fromMap(Map<String, dynamic> map){
     this.name=map['name'];
     this.cost=map['cost'];
     this.money=map['money'];
     this.quitdate=map['quitdate'];
     this.lastinteraction=map['lastinteraction'];
     this.minabstinenceperiod=map['minabstinenceperiod'];
     this.maxabstinenceperiod=map['maxabstinenceperiod'];
     this.previousabstinenceperiod=map['previousabstinenceperiod'];
     this.resets=map['resets'];
     this.spent=map['spent'];
     
  }
}
