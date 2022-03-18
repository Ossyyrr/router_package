//https://docs.flutter.dev/development/packages-and-plugins/developing-packages
import 'package:flutter/material.dart';

/// Animation types
enum AnimationType {
  normal,
  fadeIn,
  @deprecated
  fadeInSuperFast,
}

/// Main class,
/// [context] is the app's build context at that time
/// [child] is the widget to navigate to
/// [animation] is the animation type
/// [duration] is the duration of the animation
/// [replacement] if true the navigation will be of type pushReplacement

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  RouteTransitions({
    required this.context,
    required this.child,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      case AnimationType.normal:
      default:
        _normalTransition();
        break;
    }
  }

  /// transition type normal
  void _normalTransition() => Navigator.push(context, MaterialPageRoute(builder: (_) => child));

  /// transition type faceIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
        });

    replacement ? Navigator.pushReplacement(context, route) : Navigator.push(context, route);
  }
}
