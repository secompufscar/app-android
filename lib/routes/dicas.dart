import 'package:flutter/material.dart';
import 'package:app_secomp/components/dot_indicator.dart';
import 'package:app_secomp/components/animated_gradient.dart';
import 'package:flutter/painting.dart';

class Dicas extends StatefulWidget {
  @override
  _DicasState createState() => _DicasState();
}

class _DicasState extends State<Dicas> {
  final _controller = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bem vindo a X SECOMP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage("assets/logos/branca-pentagono.png"),
                height: 200,
                width: 200,
              ),
            )
          ],
        ),
      ),
    ),
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Text("Second Page"),
      ),
    ),
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Text("Third Page"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IconTheme(
      data: IconThemeData(color: _kArrowColor),
      child: Stack(
        children: <Widget>[
          AnimatedGradient(),
          PageView.builder(
            physics: new AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: DotsIndicator(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
