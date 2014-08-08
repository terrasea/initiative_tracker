import 'dart:html' show Event;

import 'package:polymer/polymer.dart';

import 'package:paper_elements/paper_input.dart';

@CustomTag('initiative-list')
class InitiativeList extends PolymerElement with ChangeNotifier  {
  List<Initiative> initiatives = toObservable([]);
  List<Player> players = toObservable([]);

  @reflectable @observable bool get start => __$start; bool __$start = false; @reflectable set start(bool value) { __$start = notifyPropertyChange(#start, __$start, value); }

  InitiativeList.created() : super.created();

  sort() => initiatives.sort((init1, init2) => init1.initiative > init2.initiative);

  hadTurn(finished) => (List initiatives) => initiatives.where((init) => init.finished == (finished == 'true')).toList();

  addInitiative(Initiative init) => initiatives.add(init);
  clearInitiatives() => initiatives.clear();


  addPlayer(Player player) => players.add(player);
  clearPlayers() {
    players.clear();
    start = false;
  }

  finish(Event e) {
    String name = e.target.id;
    var init = initiatives.firstWhere((init) => init.name == name);
    initiatives.remove(init);
    init.finished = true;
    initiatives.add(init);
  }

  setInitiatives() {
    clearInitiatives();
    players.forEach((player) {
      var init = new Initiative.create(player.name, int.parse(shadowRoot.querySelector('#player_${player.name}').value));
      addInitiative(init);
    });
  }

  addPlayerEvent() {
    var input = ($['name'] as PaperInput);
    var player = new Player.create($['name'].value);
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
}


abstract class Initiative extends ChangeNotifier {
  final String name;
  final int initiative;
  bool finished;

  Initiative(this.name, this.initiative, {this.finished: false});

  factory Initiative.create(String name, int initiative, {bool finished: false}) {
    return new _InitiativeImpl(name, initiative, finished: finished);
  }
}


class _InitiativeImpl extends Initiative {
  _InitiativeImpl(String name, int initiative, {bool finished: false}) : super(name, initiative, finished: finished);
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
