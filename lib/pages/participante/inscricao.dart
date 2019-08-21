import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_secomp/colors.dart';
import 'package:app_secomp/components/select_circles.dart';

class Inscricao extends StatelessWidget {
  final String title;

  Inscricao({this.title});

  final BlocParticipante bloc = BlocProvider.getBloc<BlocParticipante>();

  _clickSim() {
    bloc.setKit(true);
  }

  _clickNao() {
    bloc.setKit(false);
  }

  List<String> _tamanhosCamisetas = [
    "P Feminino",
    "M Feminino",
    "G Feminino",
    "GG Feminino",
    "P Masculino",
    "M Masculino",
    "G Masculino",
    "GG Masculino",
  ];

  List<DropdownMenuItem<String>> _buildDropdownItens(List<String> list) {
    List ret = <DropdownMenuItem<String>>[];
    for (var item in list) {
      ret.add(
        DropdownMenuItem(
          child: Text(item),
          value: item,
        ),
      );
    }

    return ret;
  }

  void _atualizaTamanho(String item) {
    bloc.setTamanho(item);
  }

  void _atualizaRestricao(int value) {
    bloc.setRestricao(value);
  }

  @override
  Widget build(BuildContext context) {
    StreamBuilder _circlesBuilder = StreamBuilder(
        stream: bloc.outKit,
        builder: (context, snapshot) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: _clickSim,
                child: SelectCircle(
                  color: Colors.green,
                  icon: Icons.check,
                  text: "SIM",
                  selected: snapshot.data,
                ),
              ),
              GestureDetector(
                onTap: _clickNao,
                child: SelectCircle(
                  color: Colors.red,
                  icon: Icons.close,
                  text: "NÃO",
                  selected: !snapshot.data,
                ),
              ),
            ],
          );
        });

    Widget _sessaoCamisetas = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Selecione o tamanho da camiseta"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: DropdownButton(
              isExpanded: true,
              items: _buildDropdownItens(_tamanhosCamisetas),
              onChanged: (String item) => _atualizaTamanho(item),
              hint: StreamBuilder(
                stream: bloc.outTamanho,
                builder: (context, snapshot) => Text(snapshot.data),
              )),
        ),
      ],
    );

    StreamBuilder _sessaoCamisetasBuilder = StreamBuilder(
        stream: bloc.outKit,
        builder: (context, snapshot) {
          if (snapshot.data) return _sessaoCamisetas;
          return Container();
        });

    StreamBuilder _opcoesRestricaoBuilder = StreamBuilder(
      stream: bloc.outRestricao,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            RadioListTile(
              title: Text("Nenhuma"),
              value: 0,
              groupValue: snapshot.data,
              onChanged: (value) => _atualizaRestricao(value),
            ),
            RadioListTile(
              title: Text("Vegetariano"),
              value: 1,
              groupValue: snapshot.data,
              onChanged: (value) => _atualizaRestricao(value),
            ),
            RadioListTile(
              title: Text("Vegano"),
              value: 2,
              groupValue: snapshot.data,
              onChanged: (value) => _atualizaRestricao(value),
            ),
          ],
        );
      },
    );

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColorStart: SecompColors.gradientStart,
        backgroundColorEnd: SecompColors.gradientEnd,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Inscrição", style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Você deseja comprar o kit?"),
            ),
            _circlesBuilder,
            _sessaoCamisetasBuilder,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Restrição alimentar:"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: _opcoesRestricaoBuilder,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text("Inscreva-se"),
        icon: Icon(Icons.done),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
