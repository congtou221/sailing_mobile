import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

bool isDarkMode() {
  final brightness = SchedulerBinding.instance.window.platformBrightness;
  return brightness == Brightness.dark;
}

/// Navigates to a new page with a right-to-left slide transition.
///
/// Parameters:
/// - context: The BuildContext from which the navigation is initiated.
/// - pageBuilder: A function that builds the page to be navigated to.
/// - duration: The duration of the transition animation.
void navigateWithSlideTransition(BuildContext context, Widget page,
    [Duration duration = const Duration(milliseconds: 200)]) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: duration,
    ),
  );
}
