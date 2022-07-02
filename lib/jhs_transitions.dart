library jhs_transitions;

import 'package:flutter/material.dart';

/// ## Types of animation to make the transition.
///
/// [normal] is the default animation.
///
/// [fadeIn] is a fade animation.
enum AnimationType { normal, fadeIn }

/// Class to make transition easy between screens.
class HsTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  /// ### Makes transitions to other pages, with a few parameters
  ///
  /// [context] of the application.
  ///
  /// [child] is the widget to be shown (other page to navogate to).
  ///
  /// [replacement] if true, the current page will be replaced by the new one.
  ///
  /// [animation] is the type of animation to make the transition.
  ///
  /// [duration] is the duration of the animation (This property only works if the animation type is different to 'normal').
  HsTransitions({
    required this.context,
    required this.child,
    this.replacement = false,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 500),
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      default:
    }
  }

  /// Makes a normal transition.
  void _normalTransition() {
    _handleNavigation(MaterialPageRoute(builder: (_) => child));
  }

  /// Makes a fade in transition effect.
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child,
          );
        });
    _handleNavigation(route);
  }

  /// Handle navigation depends on the Replacement property.
  void _handleNavigation(Route route) {
    if (replacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
