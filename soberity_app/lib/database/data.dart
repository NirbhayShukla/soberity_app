class Data {
  String _name;
  double _cost;
  int _money;
  String _quitdate;
  String _lastinteraction;
  int _maxabstinenceperiod;
  int _minabstinenceperiod;
  int _previousabstinenceperiod;
  int _resets;
  double _spent;

  String get name => _name;
  double get cost => _cost;
  int get money => _money;
  String get quitdate => _quitdate;
  String get lastinteraction => _lastinteraction;
  int get maxabstinenceperiod => _maxabstinenceperiod;
  int get minabstinenceperiod => _minabstinenceperiod;
  int get previousabstinenceperiod => _previousabstinenceperiod;
  int get resets => _resets;
  double get spent => _spent;

  set name(String name) {
    this._name = name;
  }

  set cost(double cost) {
    this._cost = cost;
  }

  set money(int money) {
    this._money = money;
  }

  set quitdate(String quitdate) {
    this._quitdate = quitdate;
  }

  set lastinteraction(String lastintercation){
    this._lastinteraction =lastintercation;
  }

  set maxabstinenceperiod(int maxabstinenceperiod){
    this._maxabstinenceperiod = maxabstinenceperiod;
  }

  set minabstinenceperiod(int minabstinenceperiod){
    this._minabstinenceperiod =minabstinenceperiod;
  }

  set previousabstinenceperiod(int previousabstinenceperiod){
    this._previousabstinenceperiod = previousabstinenceperiod;
  }

  set resets(int resets){
    this._resets = resets;
  }

  set spent(double spent){
    this._spent = spent;
  }

  Data(this._name, this._cost, this._lastinteraction) {
    _quitdate = "";
    _maxabstinenceperiod = 0;
    _minabstinenceperiod = 0;
    _previousabstinenceperiod = 0;
    _resets = 0;
    _spent = 0;
    _money = 1;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['name'] = _name;
    map['cost'] = _cost;
    map['money'] = _money;
    map['quitdate'] = _quitdate;
    map['lastinteraction'] = _lastinteraction;
    map['minabstinenceperiod'] = _minabstinenceperiod;
    map['maxabstinenceperiod'] = _maxabstinenceperiod;
    map['previousabstinenceperiod'] = _previousabstinenceperiod;
    map['resets'] = _resets;
    map['spent'] = _spent;

    return map;
  }

  Data.fromMap(Map<String, dynamic> map) {
    this._name = map['name'];
    this._cost = map['cost'];
    this._money = map['money'];
    this._quitdate = map['quitdate'];
    this._lastinteraction = map['lastinteraction'];
    this._minabstinenceperiod = map['minabstinenceperiod'];
    this._maxabstinenceperiod = map['maxabstinenceperiod'];
    this._previousabstinenceperiod = map['previousabstinenceperiod'];
    this._resets = map['resets'];
    this._spent = map['spent'];
  }
}
