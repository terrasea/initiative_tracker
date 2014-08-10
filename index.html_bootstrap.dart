library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'package:core_elements/core_meta.dart' as i0;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_iconset.dart' as i1;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_icon.dart' as i2;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_selection.dart' as i3;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_selector.dart' as i4;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_menu.dart' as i5;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_drag_drop.dart' as i6;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_ripple.dart' as i7;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_item.dart' as i8;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_input.dart' as i9;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_input.dart' as i10;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_focusable.dart' as i11;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_shadow.dart' as i12;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_button.dart' as i13;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_transition.dart' as i14;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_key_helper.dart' as i15;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_overlay_layer.dart' as i16;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_overlay.dart' as i17;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_transition_css.dart' as i18;
import 'package:polymer/src/build/log_injector.dart';
import 'package:core_elements/core_media_query.dart' as i19;
import 'package:polymer/src/build/log_injector.dart';
import 'package:paper_elements/paper_toast.dart' as i20;
import 'package:polymer/src/build/log_injector.dart';
import 'package:initiative_tracker/draggable_item.dart' as i21;
import 'package:polymer/src/build/log_injector.dart';
import 'package:initiative_tracker/initiative_list.dart' as i22;
import 'package:polymer/src/build/log_injector.dart';
import 'index.html.0.dart' as i23;
import 'package:polymer/src/build/log_injector.dart';
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;
import 'package:initiative_tracker/draggable_item.dart' as smoke_0;
import 'package:polymer/polymer.dart' as smoke_1;
import 'package:initiative_tracker/initiative_list.dart' as smoke_2;
import 'package:observe/src/metadata.dart' as smoke_3;
abstract class _M0 {} // PolymerElement & ChangeNotifier

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false,
      getters: {
        #$: (o) => o.$,
        #addPlayerEvent: (o) => o.addPlayerEvent,
        #blurAction: (o) => o.blurAction,
        #container: (o) => o.container,
        #contextMenuAction: (o) => o.contextMenuAction,
        #delay: (o) => o.delay,
        #disabled: (o) => o.disabled,
        #dismiss: (o) => o.dismiss,
        #downAction: (o) => o.downAction,
        #dragIt: (o) => o.dragIt,
        #dragStart: (o) => o.dragStart,
        #dragStop: (o) => o.dragStop,
        #dragged: (o) => o.dragged,
        #error: (o) => o.error,
        #finish: (o) => o.finish,
        #floatingLabel: (o) => o.floatingLabel,
        #focusAction: (o) => o.focusAction,
        #go: (o) => o.go,
        #icon: (o) => o.icon,
        #iconSrc: (o) => o.iconSrc,
        #init: (o) => o.init,
        #initiative: (o) => o.initiative,
        #initiatives: (o) => o.initiatives,
        #inputChangeAction: (o) => o.inputChangeAction,
        #inputValue: (o) => o.inputValue,
        #invalid: (o) => o.invalid,
        #label: (o) => o.label,
        #multi: (o) => o.multi,
        #multiline: (o) => o.multiline,
        #name: (o) => o.name,
        #narrowMode: (o) => o.narrowMode,
        #newTurn: (o) => o.newTurn,
        #opened: (o) => o.opened,
        #placeholder: (o) => o.placeholder,
        #player: (o) => o.player,
        #players: (o) => o.players,
        #raisedButton: (o) => o.raisedButton,
        #readonly: (o) => o.readonly,
        #required: (o) => o.required,
        #responsiveWidth: (o) => o.responsiveWidth,
        #rows: (o) => o.rows,
        #selectionSelect: (o) => o.selectionSelect,
        #setInitiatives: (o) => o.setInitiatives,
        #start: (o) => o.start,
        #text: (o) => o.text,
        #transitionEndAction: (o) => o.transitionEndAction,
        #type: (o) => o.type,
        #upAction: (o) => o.upAction,
        #z: (o) => o.z,
      },
      setters: {
        #container: (o, v) { o.container = v; },
        #dragged: (o, v) { o.dragged = v; },
        #icon: (o, v) { o.icon = v; },
        #iconSrc: (o, v) { o.iconSrc = v; },
        #initiative: (o, v) { o.initiative = v; },
        #inputValue: (o, v) { o.inputValue = v; },
        #multi: (o, v) { o.multi = v; },
        #name: (o, v) { o.name = v; },
        #narrowMode: (o, v) { o.narrowMode = v; },
        #newTurn: (o, v) { o.newTurn = v; },
        #opened: (o, v) { o.opened = v; },
        #start: (o, v) { o.start = v; },
        #z: (o, v) { o.z = v; },
      },
      parents: {
        smoke_0.DraggableItem: smoke_1.PolymerElement,
        smoke_2.InitiativeList: _M0,
        _M0: smoke_1.PolymerElement,
      },
      declarations: {
        smoke_0.DraggableItem: {
          #icon: const Declaration(#icon, String, kind: PROPERTY, annotations: const [const smoke_1.PublishedProperty(reflect: true)]),
          #initiative: const Declaration(#initiative, int, kind: PROPERTY, annotations: const [const smoke_1.PublishedProperty(reflect: true)]),
          #name: const Declaration(#name, String, kind: PROPERTY, annotations: const [const smoke_1.PublishedProperty(reflect: true)]),
        },
        smoke_2.InitiativeList: {
          #dragged: const Declaration(#dragged, bool, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_3.observable]),
          #newTurn: const Declaration(#newTurn, bool, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_3.observable]),
          #start: const Declaration(#start, bool, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_3.observable]),
        },
      },
      names: {
        #$: r'$',
        #addPlayerEvent: r'addPlayerEvent',
        #blurAction: r'blurAction',
        #container: r'container',
        #contextMenuAction: r'contextMenuAction',
        #delay: r'delay',
        #disabled: r'disabled',
        #dismiss: r'dismiss',
        #downAction: r'downAction',
        #dragIt: r'dragIt',
        #dragStart: r'dragStart',
        #dragStop: r'dragStop',
        #dragged: r'dragged',
        #error: r'error',
        #finish: r'finish',
        #floatingLabel: r'floatingLabel',
        #focusAction: r'focusAction',
        #go: r'go',
        #icon: r'icon',
        #iconSrc: r'iconSrc',
        #init: r'init',
        #initiative: r'initiative',
        #initiatives: r'initiatives',
        #inputChangeAction: r'inputChangeAction',
        #inputValue: r'inputValue',
        #invalid: r'invalid',
        #label: r'label',
        #multi: r'multi',
        #multiline: r'multiline',
        #name: r'name',
        #narrowMode: r'narrowMode',
        #newTurn: r'newTurn',
        #opened: r'opened',
        #placeholder: r'placeholder',
        #player: r'player',
        #players: r'players',
        #raisedButton: r'raisedButton',
        #readonly: r'readonly',
        #required: r'required',
        #responsiveWidth: r'responsiveWidth',
        #rows: r'rows',
        #selectionSelect: r'selectionSelect',
        #setInitiatives: r'setInitiatives',
        #start: r'start',
        #text: r'text',
        #transitionEndAction: r'transitionEndAction',
        #type: r'type',
        #upAction: r'upAction',
        #z: r'z',
      }));
  new LogInjector().injectLogsFromUrl('index.html._buildLogs');
  configureForDeployment([
      i0.upgradeCoreMeta,
      i1.upgradeCoreIconset,
      i2.upgradeCoreIcon,
      i3.upgradeCoreSelection,
      i4.upgradeCoreSelector,
      i5.upgradeCoreMenu,
      i6.upgradeCoreDragDrop,
      i7.upgradePaperRipple,
      i8.upgradePaperItem,
      i9.upgradeCoreInput,
      i10.upgradePaperInput,
      i11.upgradePaperFocusable,
      i12.upgradePaperShadow,
      i13.upgradePaperButton,
      i14.upgradeCoreTransition,
      i15.upgradeCoreKeyHelper,
      i16.upgradeCoreOverlayLayer,
      i17.upgradeCoreOverlay,
      i18.upgradeCoreTransitionCss,
      i19.upgradeCoreMediaQuery,
      i20.upgradePaperToast,
      () => Polymer.register('draggable-item', i21.DraggableItem),
      () => Polymer.register('initiative-list', i22.InitiativeList),
    ]);
  i23.main();
}
