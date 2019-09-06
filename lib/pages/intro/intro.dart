import 'package:app_secomp/components/text_button.dart';
import 'package:app_secomp/pages/home/home.dart';
import 'package:app_secomp/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../base.dart';

class Intro extends StatefulWidget {
  static Widget _buildItem({String image, Widget child}) => SizedBox.expand(
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ],
          ),
        ),
      );

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final Widget placeholder = Container(color: Colors.grey);

  Widget _fab = Container();

  List<Widget> _buildItemList(BuildContext context) => [
        Intro._buildItem(
          image: 'assets/images/car1.jpg',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              Image.asset(
                'assets/logos/logo.png',
                width: 200,
                height: 200,
              ),
              Spacer(),
              Text(
                "Bem vindo a",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Text(
                "X SECOMP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        Intro._buildItem(
          image: 'assets/images/car2.jpg',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Palestras",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "Todos os dias",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Spacer(),
              Text(
                "Minicursos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "De 4 a 6 horas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
        Intro._buildItem(
          image: 'assets/images/car3.jpg',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Workshops",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "Para aprender a prática",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Spacer(),
              Text(
                "Feira empresarial",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "Aproximando oportunidades",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    void _pushTo(Widget page) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => page,
        ),
      );
    }

    void _showFab() {
      setState(() {
        _fab = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              "Não quero entrar agora",
              style: TextStyle(fontSize: 14),
              action: () => _pushTo(Base(first: HomePage(), title: "Área do Participante",)),
            ),
            FloatingActionButton.extended(
              label: Text("Entre com sua conta!"),
              icon: Icon(Icons.account_circle),
              onPressed: () => _pushTo(CamposLogin()),
            ),
          ],
        );
      });
    }

    void _hideFab() {
      setState(() {
        _fab = SizedBox(height: 80, width: 80,);
      });
    }

    return Scaffold(
      body: Center(
        child: CarouselSlider(
          onPageChanged: (page) => page == 2 ? _showFab() : _hideFab(),
          viewportFraction: 0.9,
          aspectRatio: 0.8,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          pauseAutoPlayOnTouch: Duration(seconds: 2),
          items: _buildItemList(context).map(
            (item) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  elevation: 4,
                  shadowColor: Colors.black54,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: item),
                ),
              );
            },
          ).toList(),
        ),
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: Duration(milliseconds: 100),
        transitionBuilder: (child, animation) => ScaleTransition(
          child: child,
          scale: animation,
        ),
        child: _fab,
      ),
    );
  }
}
