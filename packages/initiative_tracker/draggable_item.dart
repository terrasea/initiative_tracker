import 'dart:html' show DivElement, MouseEvent, Element, TouchEvent;

import 'package:polymer/polymer.dart';

@CustomTag('draggable-item')
class DraggableItem extends PolymerElement {
  @PublishedProperty(reflect: true)
  String get icon => readValue(#icon);
  set icon(val) => writeValue(#icon, val);

  @PublishedProperty(reflect: true)
  String get name => readValue(#name);
  set name(val) => writeValue(#name, val);

  @PublishedProperty(reflect: true)
  int get initiative => readValue(#initiative);
  set initiative(val) => writeValue(#initiative, val);

  @PublishedProperty(reflect: true)
  bool get dragging => readValue(#dragging);
  set dragging(val) => writeValue(#dragging, val);

  DraggableItem.created() : super.created();

  ready() {
    super.ready();
    var col = $['draggable'];

    //col.onDragStart.listen(_onDragStart);
/*    col.onDragEnd.listen(_onDragEnd);
    col.onDragEnter.listen(_onDragEnter);*/
    //col.onDragOver.listen(_onDragOver);
    /*col.onDragLeave.listen(_onDragLeave);
     */
    //col.onDrop.listen(_onDrop);
  }

  void _onDragStart(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.add('moving');
    //event.dataTransfer.effectAllowed = 'move';
    fire('drag-started', detail: id);
  }
/*
  void _onDragEnd(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.remove('moving');
    print('drag-end');
  }

  void _onDragEnter(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.add('over');
    print('drag-enter');
  }
*/
  void _onDragOver(MouseEvent event) {
    // This is necessary to allow us to drop.
    event.preventDefault();
    event.dataTransfer.dropEffect = 'move';
    print('drag-over');
  }
/*
  void _onDragLeave(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.remove('over');
    style.borderColor = "red";
    style.borderWidth = "0";
    print('drag-leave');
  }
*/
  void _onDrop(MouseEvent event) {
    // Stop the browser from redirecting.
    event.stopPropagation();

    // Don't do anything if dropping onto the same column we're dragging.
    Element dropTarget = event.target;
    fire('drop-finished', detail: id);
    print('drop');
    //dropTarget.innerHtml = event.dataTransfer.getData('text/html');
  }

}