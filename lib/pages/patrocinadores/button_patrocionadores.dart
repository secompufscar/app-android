import 'package:flutter/material.dart';

class ButtonPatrocionadores extends StatelessWidget {
  final Function() onTap, onTapTwo, onTapThree, onTapFour;
  final bool anime, animeTwo, animeThree, animeFour;

  ButtonPatrocionadores(
      {Key key,
      this.onTap,
      this.onTapTwo,
      this.onTapThree,
      this.onTapFour,
      this.anime,
      this.animeTwo,
      this.animeThree,
      this.animeFour})
      : super(key: key);

  var _height = 50.0;
  var shape = BoxShape.circle;

  Widget _textButton() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          child: Align(
            child: Text(
              'Diamante',
              textAlign: TextAlign.justify,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            alignment: Alignment.center,
          ),
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _textButtonTwo() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          child: Align(
            child: Text(
              'Ouro',
              textAlign: TextAlign.justify,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            alignment: Alignment.center,
          ),
          color: Colors.yellow,
        ),
      ),
    );
  }

  Widget _textButtonThree() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          child: Align(
            child: Text(
              'Prata',
              textAlign: TextAlign.justify,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            alignment: Alignment.center,
          ),
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 50,
              width: anime ? 80 : 140,
              curve: Curves.decelerate,
              child: GestureDetector(
                onTap: onTap,
                child: _textButton(),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _height,
              width: animeTwo ? 80 : 140,
              curve: Curves.decelerate,
              child: GestureDetector(
                onTap: onTapTwo,
                child: _textButtonTwo(),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _height,
              width: animeThree ? 80 : 140,
              curve: Curves.decelerate,
              child: GestureDetector(
                onTap: onTapThree,
                child: _textButtonThree(),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
