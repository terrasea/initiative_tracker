import 'dart:html' show MouseEvent, Event, document;

import 'package:polymer/polymer.dart';

import 'package:paper_elements/paper_input.dart';
import 'package:paper_elements/paper_item.dart';

//import 'package:initiative_tracker/draggable_item.dart';


@CustomTag('initiative-list')
class InitiativeList extends PolymerElement with ChangeNotifier  {
  ObservableList<Initiative> initiatives = toObservable([]);

  List<Initiative> notDoneInitiatives = toObservable([]);
  List<Initiative> doneInitiatives = toObservable([]);
  List<Player> players = toObservable([]);

  @reflectable @observable bool get start => __$start; bool __$start = false; @reflectable set start(bool value) { __$start = notifyPropertyChange(#start, __$start, value); }
  @reflectable @observable bool get newTurn => __$newTurn; bool __$newTurn = true; @reflectable set newTurn(bool value) { __$newTurn = notifyPropertyChange(#newTurn, __$newTurn, value); }
  @reflectable @observable bool get dragged => __$dragged; bool __$dragged = false; @reflectable set dragged(bool value) { __$dragged = notifyPropertyChange(#dragged, __$dragged, value); }

  InitiativeList.created() : super.created();

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
    PaperItem item = e.target.parent as PaperItem;

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
    if(e.target is PaperItem) {
      PaperItem target = e.target as PaperItem;
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
  }


  drag(Event e) {
    var dragInfo = e.detail;
    print(dragInfo);
  }

  addPlayerEvent() {
    var input = ($['name'] as PaperInput);
    var player = new Player.create($['name'].value.trim());
    addPlayer(player);
    input.value = '';
    input.focus();
  }

  go() {
    start = true;
  }

  reset() {
    start = false;
    players.clear();
  }


  dragStart(Event ev) {
    //ev.dataTransfer.effectAllowed='none';
    //ev.dataTransfer.setData("Text",'hello');
    // draginfo=this;
    //var jsEv = new js.JsObject.fromBrowserObject(ev);
    //var dragInfo = jsEv['detail'];
    //dragInfo.drag = dragIt;
    //dragInfo.drop = dragStop;
    //print('dragStart: ${ev.dataTransfer}');
    //print("dragStart: ${ev.currentTarget.id}");// ${ev.dataTransfer.getData('Text')}");
    dragged = true;
  }


  dragIt(Event ev) {
    //print("dragIt: ${ev.path}");
  }

  dragOver(ev) {

  }

  dragStop(Event ev) {
    //if (draginfo=="") return;
    ev.preventDefault();
    //var data = ev.dataTransfer.getData("Text");
    //print("dragStop $ev, ${ev.clipboardData}, ${ev.target.id}, ${ev.path.last}");
    var parent = this.parent;

    //parent.insertBefore(draginfo,this)
    // draginfo="";

    //ev.target.appendChild(document.getElementById(data));

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
