import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  FadeAnimation({this.delay, this.child});
  final double delay;
  final Widget child;

  final _tween = MultiTween<AniProps>()
  ..add(AniProps.opacity, 0.0.tweenTo(1.0), 1000.milliseconds)
  ..add(AniProps.translateY, 30.0.tweenTo(0.0), 1000.milliseconds);

  @override
  Widget build(BuildContext context) {
//    // ignore: deprecated_member_use
//    final tween = MultiTrackTween([
//      Track("opacity").add(
//        Duration(milliseconds: 500),
//        Tween(begin: 0.0, end: 1.0),
//
//      ),
//      Track("translateY").add(
//        Duration(milliseconds: 300),
//        Tween(begin: 30.0, end: 0.0),
//      ),
//    ]);

    return PlayAnimation<MultiTweenValues>(
      delay: Duration(
        milliseconds: (500 * delay).round(),
      ),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, value.get(AniProps.translateY
          )),
          child: child,
        ),
      ),
    );
  }
}
