import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_secomp/colors.dart';
import 'package:app_secomp/components/select_circles.dart';

class Inscricao extends StatefulWidget {
  final String title;

  Inscricao({this.title});

  @override
  _InscricaoState createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  bool _kitSim = false;
  bool _kitNao = false;
  Widget _sessaoCamisetas = Container();
  String _tamanhoSelecionado = "Selecione o tamanho";
  int _restricaoSelecionada = 0;

  _clickSim() {
    setState(() {
      _kitSim = true;
      _kitNao = false;
    });
  }

  _clickNao() {
    setState(() {
      _kitNao = true;
      _kitSim = false;
    });
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
    setState(() {
      _tamanhoSelecionado = item;
    });
  }

  void _atualizaRestricao(int value) {
    setState(() {
      _restricaoSelecionada = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_kitSim)
      setState(() {
        _sessaoCamisetas = Column(
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
                hint: Text(_tamanhoSelecionado),
              ),
            ),
          ],
        );
      });
    else
      setState(() {
        _sessaoCamisetas = Container();
      });

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          widget.title,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: _clickSim,
                  child: SelectCircle(
                    color: Colors.green,
                    icon: Icons.check,
                    text: "SIM",
                    selected: _kitSim,
                  ),
                ),
                GestureDetector(
                  onTap: _clickNao,
                  child: SelectCircle(
                    color: Colors.red,
                    icon: Icons.close,
                    text: "NÃO",
                    selected: _kitNao,
                  ),
                ),
              ],
            ),
            _sessaoCamisetas,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Restrição alimentar:"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    title: Text("Nenhuma"),
                    value: 0,
                    groupValue: _restricaoSelecionada,
                    onChanged: (int value) => _atualizaRestricao(value),
                  ),
                  RadioListTile(
                    title: Text("Vegetariano"),
                    value: 1,
                    groupValue: _restricaoSelecionada,
                    onChanged: (int value) => _atualizaRestricao(value),
                  ),
                  RadioListTile(
                    title: Text("Vegano"),
                    value: 2,
                    groupValue: _restricaoSelecionada,
                    onChanged: (int value) => _atualizaRestricao(value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text("Inscreva-se"),
        icon: Icon(Icons.done),
        backgroundColor: Colors.cyan,
      )
    );
  }
}
