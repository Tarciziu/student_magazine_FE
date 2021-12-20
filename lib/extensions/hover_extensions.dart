import 'package:flutter/material.dart';
import 'package:practica_fe/extensions/hover/blueshadow_on_hover.dart';
import "dart:html" as html;

import 'hover/translate_on_hover.dart';

extension HoverExtensions on Widget {
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: this,
      ),
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }

  Widget get blueShadowOnHover {
    return BlueShadowOnHover(
      child: this,
    );
  }
}