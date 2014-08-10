import 'package:polymer/polymer.dart';

import 'dart:html' show DivElement, MouseEvent, Element;

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

  Element _dragSourceEl;

  DraggableItem.created() : super.created();

  ready() {
    draggable = true;
    onDragStart.listen(_onDragStart);
    onDragEnd.listen(_onDragEnd);
    onDragEnter.listen(_onDragEnter);
    onDragOver.listen(_onDragOver);
    onDragLeave.listen(_onDragLeave);
    onDrop.listen(_onDrop);
    var host = this.parent == null ? this : this.parent;
    host.setAttribute('touch-action', 'none');
    host.style.cssText += '; user-select: none; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none;';
  }

  void _onDragStart(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.add('moving');
    _dragSourceEl = dragTarget;
    event.dataTransfer.effectAllowed = 'move';
    event.dataTransfer.setData('text/html', dragTarget.innerHtml);
    print('start');
  }

  void _onDragEnd(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.remove('moving');
  }

  void _onDragEnter(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.add('over');
  }

  void _onDragOver(MouseEvent event) {
    // This is necessary to allow us to drop.
    event.preventDefault();
    event.dataTransfer.dropEffect = 'move';
  }

  void _onDragLeave(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.remove('over');
  }

  void _onDrop(MouseEvent event) {
    // Stop the browser from redirecting.
    event.stopPropagation();

    // Don't do anything if dropping onto the same column we're dragging.
    Element dropTarget = event.target;
    if (_dragSourceEl != dropTarget) {
      // Set the source column's HTML to the HTML of the column we dropped on.
      _dragSourceEl.innerHtml = dropTarget.innerHtml;
      dropTarget.innerHtml = event.dataTransfer.getData('text/html');
    }
  }

}