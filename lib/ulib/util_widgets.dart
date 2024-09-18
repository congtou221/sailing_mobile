import 'package:flutter/widgets.dart';

class ContextHolder extends InheritedWidget {
  const ContextHolder({
    super.key,
    required this.context,
    required super.child,
  });

  final BuildContext context;

  static ContextHolder? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ContextHolder>();
  }

  @override
  bool updateShouldNotify(ContextHolder old) => true;
}
