library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'package:core_elements/core_meta.dart' as i0;
import 'package:core_elements/core_iconset.dart' as i1;
import 'package:core_elements/core_icon.dart' as i2;
import 'package:core_elements/core_selection.dart' as i3;
import 'package:core_elements/core_selector.dart' as i4;
import 'package:core_elements/core_menu.dart' as i5;
import 'package:paper_elements/paper_ripple.dart' as i6;
import 'package:paper_elements/paper_item.dart' as i7;
import 'package:core_elements/core_input.dart' as i8;
import 'package:paper_elements/paper_input.dart' as i9;
import 'package:paper_elements/paper_focusable.dart' as i10;
import 'package:paper_elements/paper_shadow.dart' as i11;
import 'package:paper_elements/paper_button.dart' as i12;
import 'package:initiative_tracker/initiative_list.dart' as i13;
import 'index.html.0.dart' as i14;
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;
import 'package:initiative_tracker/initiative_list.dart' as smoke_0;
import 'package:polymer/polymer.dart' as smoke_1;
import 'package:observe/src/metadata.dart' as smoke_2;
abstract class _M0 {} // PolymerElement & ChangeNotifier

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false,
      getters: {
        #addPlayerEvent: (o) => o.addPlayerEvent,
        #blurAction: (o) => o.blurAction,
        #contextMenuAction: (o) => o.contextMenuAction,
        #disabled: (o) => o.disabled,
        #downAction: (o) => o.downAction,
        #error: (o) => o.error,
        #finish: (o) => o.finish,
        #floatingLabel: (o) => o.floatingLabel,
        #focusAction: (o) => o.focusAction,
        #go: (o) => o.go,
        #hadTurn: (o) => o.hadTurn,
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
        #notFinished: (o) => o.notFinished,
        #placeholder: (o) => o.placeholder,
        #player: (o) => o.player,
        #players: (o) => o.players,
        #raisedButton: (o) => o.raisedButton,
        #readonly: (o) => o.readonly,
        #required: (o) => o.required,
        #rows: (o) => o.rows,
        #selectionSelect: (o) => o.selectionSelect,
        #setInitiatives: (o) => o.setInitiatives,
        #start: (o) => o.start,
        #transitionEndAction: (o) => o.transitionEndAction,
        #type: (o) => o.type,
        #upAction: (o) => o.upAction,
        #z: (o) => o.z,
      },
      setters: {
        #icon: (o, v) { o.icon = v; },
        #iconSrc: (o, v) { o.iconSrc = v; },
        #inputValue: (o, v) { o.inputValue = v; },
        #multi: (o, v) { o.multi = v; },
        #name: (o, v) { o.name = v; },
        #start: (o, v) { o.start = v; },
        #z: (o, v) { o.z = v; },
      },
      parents: {
        smoke_0.InitiativeList: _M0,
        _M0: smoke_1.PolymerElement,
      },
      declarations: {
        smoke_0.InitiativeList: {
          #start: const Declaration(#start, bool, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_2.observable]),
        },
      },
      names: {
        #addPlayerEvent: r'addPlayerEvent',
        #blurAction: r'blurAction',
        #contextMenuAction: r'contextMenuAction',
        #disabled: r'disabled',
        #downAction: r'downAction',
        #error: r'error',
        #finish: r'finish',
        #floatingLabel: r'floatingLabel',
        #focusAction: r'focusAction',
        #go: r'go',
        #hadTurn: r'hadTurn',
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
        #notFinished: r'notFinished',
        #placeholder: r'placeholder',
        #player: r'player',
        #players: r'players',
        #raisedButton: r'raisedButton',
        #readonly: r'readonly',
        #required: r'required',
        #rows: r'rows',
        #selectionSelect: r'selectionSelect',
        #setInitiatives: r'setInitiatives',
        #start: r'start',
        #transitionEndAction: r'transitionEndAction',
        #type: r'type',
        #upAction: r'upAction',
        #z: r'z',
      }));
  configureForDeployment([
      i0.upgradeCoreMeta,
      i1.upgradeCoreIconset,
      i2.upgradeCoreIcon,
      i3.upgradeCoreSelection,
      i4.upgradeCoreSelector,
      i5.upgradeCoreMenu,
      i6.upgradePaperRipple,
      i7.upgradePaperItem,
      i8.upgradeCoreInput,
      i9.upgradePaperInput,
      i10.upgradePaperFocusable,
      i11.upgradePaperShadow,
      i12.upgradePaperButton,
      () => Polymer.register('initiative-list', i13.InitiativeList),
    ]);
  i14.main();
}
