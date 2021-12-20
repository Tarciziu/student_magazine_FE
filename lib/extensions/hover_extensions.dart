import 'package:flutter/material.dart';
import 'package:practica_fe/extensions/hover/blueshadow_on_hover.dart';
import "dart:html" as html;

import 'hover/translate_on_hover.dart';

extension HoverExtensions on Widget {
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // the widget we're using the extension on
      onHover: (event) => appContainer!.style.cursor = 'pointer',
      onExit: (event) => appContainer!.style.cursor = 'default',
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