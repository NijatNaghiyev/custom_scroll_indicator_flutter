import 'package:flutter/cupertino.dart';

/// Returns a value between 0 and 1 indicating how much of the widget with the given [key] is visible
/// within the viewport of the given [context].
/// Returns 1 if the widget is fully visible between y coordinates 20 and 130,
/// Returns 0 if the widget is outside this range.
double getVisiblePercentage(GlobalKey key, BuildContext context) {
  final RenderObject? renderObject = key.currentContext?.findRenderObject();
  if (renderObject is! RenderBox) return 0.0;

  // Widget's position and size in global coordinates
  final widgetOffset = renderObject.localToGlobal(Offset.zero);

  return (20 < widgetOffset.dy && widgetOffset.dy < 130) ? 1 : 0;
}