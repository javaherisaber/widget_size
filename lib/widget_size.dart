library widget_size;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// A widget to calculate it's size after being built and attached to a widget tree
/// [onChange] get changed [Size] of the Widget
/// [child] Widget to get size of it at runtime
class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function(Size) onChange;

  const WidgetSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  Size? oldSize;

  void postFrameCallback(_) async {
    var context = widgetKey.currentContext;
    await Future.delayed(const Duration(milliseconds: 100)); // wait till the widget is drawn
    if (!mounted || context == null) return; // not yet attached to layout

    var newSize = context.size!;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
