import 'package:flutter/material.dart';

class LogoSeKombi extends StatelessWidget {
  final double w;
  final double h;

  LogoSeKombi({this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/logos/colorida-completa.png'),
      height: w,
      width: h,
    );
  }
}
