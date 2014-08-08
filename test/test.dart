library initiative_tracker.test;

import 'package:scheduled_test/scheduled_test.dart';
import 'package:unittest/html_config.dart';
import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

part 'initiative_list_test.dart';

main() {
  useHtmlConfiguration(true);

  initPolymer();


  initiative_list_test();
}


pollForDone(List tests) {
  if (tests.every((t)=> t.isComplete)) {
    window.postMessage('dart-main-done', window.location.href);
    return;
  }

  var wait = new Duration(milliseconds: 100);
  new Timer(wait, ()=> pollForDone(tests));
}


createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}


class PageComponent {
  PolymerElement component;

  PageComponent(this.component);

  Future flush() {
    Completer completer = new Completer();

    component.async((_) => completer.complete());

    return completer.future;
  }


  String get currentTextDisplay => component.shadowRoot.text;
}