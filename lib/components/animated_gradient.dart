import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:app_secomp/colors.dart';


class AnimatedGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 6),
          ColorTween(begin: SecompColors.dicas1, end: SecompColors.dicas2)),
      Track("color2").add(Duration(seconds: 6),
          ColorTween(begin: SecompColors.dicas2, end: SecompColors.dicas1))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}