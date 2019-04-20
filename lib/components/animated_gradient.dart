import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:app_secomp/colors.dart';


class AnimatedGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: SecompColors.gradientStart, end: SecompColors.gradientEnd)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: SecompColors.gradientEnd, end: SecompColors.gradientStart))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}