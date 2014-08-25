import 'dart:html' show MouseEvent, Event, document, TouchEvent, Element;

import 'dart:async' show Timer, Duration;

import 'package:polymer/polymer.dart';

import 'package:paper_elements/paper_input.dart';

import 'package:initiative_tracker/draggable_item.dart';


@CustomTag('initiative-list')
class InitiativeList extends PolymerElement with ChangeNotifier  {
  ObservableList<Initiative> initiatives = toObservable([]);

  List<Initiative> notDoneInitiatives = toObservable([]);
  List<Initiative> doneInitiatives = toObservable([]);
  List<Player> players = toObservable([]);

  @reflectable @observable bool get start => __$start; bool __$start = false; @reflectable set start(bool value) { __$start = notifyPropertyChange(#start, __$start, value); }
  @reflectable @observable bool get newTurn => __$newTurn; bool __$newTurn = true; @reflectable set newTurn(bool value) { __$newTurn = notifyPropertyChange(#newTurn, __$newTurn, value); }
  @reflectable @observable bool get dragged => __$dragged; bool __$dragged = false; @reflectable set dragged(bool value) { __$dragged = notifyPropertyChange(#dragged, __$dragged, value); }

  var dragSourceID;

  InitiativeList.created() : super.created() {
    on['drag-started'].listen((Event e) {
      dragSourceID = e.detail;
      print('drag-started');
      //e.preventDefault();
    });
    on['drop-finished'].listen((Event e) {
      swap(dragSourceID, e.detail);
      print('drop-finished');
      //e.preventDefault();
    });
  }

  final List<Element> draggables = toObservable([]);

  attached() {
    super.attached();
  }

  touchStart(TouchEvent e) {
    print('start: ${e.targetTouches.map((touch) => touch.target.id)}');
    draggables
      ..clear()
      ..addAll(shadowRoot.querySelectorAll('.draggable'));
  }

  touchMove(TouchEvent e) {
    print('move: ${e.targetTouches.map((touch) => [touch.target.id, touch.client.x, touch.client.y])}');

  }

  touchEnd(TouchEvent e) {
    print('end: ${e.targetTouches.map((touch) => [touch.client.x, touch.client.y])}');
  }


  swap(String name1, String name2) {
    Initiative nextInit = initiatives.firstWhere((init) => init.name == name1);
    Initiative currentInit = initiatives.firstWhere((init) => init.name == name2);
    int oldOrder = currentInit.order;
    currentInit.order = nextInit.order;
    nextInit.order = oldOrder;
    sort();
    print(initiatives.map((e) => [e.order, e.name, e.initiative]));
  }

  sort() {
    notDoneInitiatives.sort((init1, init2) => (init1.order - init2.order));
    initiatives.sort((init1, init2) => (init1.order - init2.order));
  }

  hadTurn(bool finished) => (List initiatives) => initiatives.where((init) => init.finished == finished).toList();

  addInitiative(Initiative init) {
    initiatives.add(init);
    notDoneInitiatives.add(init);
  }

  clearInitiatives() {
    initiatives.clear();
    notDoneInitiatives.clear();
    doneInitiatives.clear();
  }


  addPlayer(Player player) => players.add(player);
  clearPlayers() {
    players.clear();
    start = false;
  }

  delay(Event e) {
    DraggableItem item = e.target.parent as DraggableItem;

    var currentId = item.id;
    if(item.nextElementSibling != null) {
      var nextId = item.nextElementSibling.id;
      Initiative nextInit = initiatives.firstWhere((init) => init.name == nextId);
      Initiative currentInit = initiatives.firstWhere((init) => init.name == currentId);
      int oldOrder = currentInit.order;
      currentInit.order = nextInit.order;
      nextInit.order = oldOrder;
      sort();
    }
  }

  finish(Event e) {
    if(e.target is DraggableItem) {
      DraggableItem target = e.target as DraggableItem;
      String name = target.id;
      var init = notDoneInitiatives.firstWhere((init) => init.name == name, orElse: () => new Initiative.create(name, 0, 0));
      if(notDoneInitiatives.first == init) {
        if(notDoneInitiatives.first == notDoneInitiatives.last) {
          newTurn = true;
          clearInitiatives();
        }
        notDoneInitiatives.remove(init);
        init.finished = true;
        doneInitiatives.add(init);
        //initiatives.deliverChanges();
      } else {
        $['missed-turn'].show();
      }
    }
  }

  notFinished(Event e) {
    String name = e.target.id;
    var init = doneInitiatives.firstWhere((init) => init.name == name);
    doneInitiatives.remove(init);
    init.finished = false;
    notDoneInitiatives.add(init);
    sort();
  }

  setInitiatives() {
    clearInitiatives();
    int order = 0;
    players.forEach((player) {
      int initValue = int.parse(shadowRoot.querySelector('#player_${player.name}').value);
      var init = new Initiative.create(player.name, initValue, 0);
      addInitiative(init);
    });
    initiatives.sort((init1, init2) => -(init1.initiative - init2.initiative));
    initiatives.forEach((init) => init.order = order++);
    sort();
    newTurn = false;
    new Timer(new Duration(milliseconds: 500), () {
      print(this.children.map((el) => [el.id, el.client.topLeft, el.client.topRight, el.client.bottomRight, el.client.bottomLeft]));
    });
  }

  addPlayerEvent() {
    var input = ($['name'] as PaperInput);
    var name = input.value.trim();
    if(name.isNotEmpty) {
      var player = new Player.create(name);
      addPlayer(player);
    }
    input.value = '';
  }

  go() {
    start = true;
  }

  reset() {
    start = false;
    players.clear();
  }



}


abstract class Initiative extends ChangeNotifier {
  String name;
  int initiative;
  int order;
  bool _finished;
  bool get finished => _finished;

  set finished(val) {
    String oldIcon = icon;
    notifyPropertyChange(#finished, _finished, val);
    _finished = val;
    notifyPropertyChange(#icon, oldIcon, icon);
  }

  @observable String get icon => finished ? 'check' : '';
  set icon(val) {}

  Initiative(this.name, this.initiative, this.order, this._finished);

  factory Initiative.create(String name, int initiative, int order, {bool finished: false}) {
    return new _InitiativeImpl(name, initiative, order, finished: finished);
  }

  bool operator>(Initiative rhs) => initiative > rhs.initiative;
}


class _InitiativeImpl extends Initiative {
  _InitiativeImpl(String name, int initiative, int order, {bool finished: false}) : super(name, initiative, order, finished);
}


abstract class Player  {
  final String name;

  const Player(this.name);

  factory Player.create(String name) {
    return new _PlayerImpl(name);
  }
}


class _PlayerImpl extends Player {
  const _PlayerImpl(String name) : super(name);
}
