import 'package:flutter/material.dart';

class BlueShadowOnHover extends StatefulWidget {
  final Widget child;
  const BlueShadowOnHover({Key? key, required this.child}) : super(key: key);

  @override
  _BlueShadowOnHoverState createState() => _BlueShadowOnHoverState();
}

class _BlueShadowOnHoverState extends State<BlueShadowOnHover> {
  final nonHoverTransform = const BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 1),
    blurRadius: 6.0,
  );
  final hoverTransform = const BoxShadow(
    color: Colors.blue,
    offset: Offset(0, 1),
    blurRadius: 6.0,
  );

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        decoration: BoxDecoration(boxShadow: [_hovering ? hoverTransform : nonHoverTransform],)
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
