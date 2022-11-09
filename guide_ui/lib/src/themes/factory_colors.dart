import 'package:flutter/material.dart';

class _LightColors extends ColorsBase {
  _LightColors()
      : super(
          primary: const Color(0xFF004041),
          secundary: const Color(0xffffffff),
          disabledColor: const Color(0xFFb5b5b5),
          hintColor: const Color(0xFFE4E4E4),
        );
}

class _DarkColors extends ColorsBase {
  _DarkColors()
      : super(
          primary: const Color(0xFF062121),
          secundary: const Color(0xffffffff),
          disabledColor: const Color(0xFFb5b5b5),
          hintColor: const Color(0xFFE4E4E4),
        );
}

abstract class ColorsBase {
  ColorsBase({
    required this.primary,
    required this.secundary,
    required this.hintColor,
    required this.disabledColor,
  });

  Color primary;
  Color secundary;
  Color hintColor;
  Color disabledColor;
}

class FactoryColors {
  static final FactoryColors _singleton = FactoryColors._internal();

  factory FactoryColors() {
    return _singleton;
  }

  ColorsBase? _colorBase;

  FactoryColors._internal();

  ColorsBase get() {
    _singleton._colorBase ??= _LightColors();
    return _singleton._colorBase!;
  }

  void set(ColorsInstanceType type) async {
    if (type == ColorsInstanceType.light) {
      _singleton._colorBase = _LightColors();
      return;
    } else if (type == ColorsInstanceType.dark) {
      _singleton._colorBase = _DarkColors();
    }
  }
}

enum ColorsInstanceType { light, dark }
