import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class BlocParticipante extends BlocBase {
  BlocParticipante();

  // KIT
  bool kit;
  var _kitController = BehaviorSubject<bool>.seeded(null);
  Stream<bool> get outKit => _kitController.stream;
  Sink<bool> get inKit => _kitController.sink;

  void setKit(bool value) {
    kit = value;
    inKit.add(_kitController.value = value);
  }

  // TAMANHO CAMISETA
  String tamanho;
  var _tamanhoController = BehaviorSubject<String>.seeded("");
  Stream<String> get outTamanho => _tamanhoController.stream;
  Sink<String> get inTamanho => _tamanhoController.sink;

  void setTamanho(String tamanho) {
    this.tamanho = tamanho;
    inTamanho.add(_tamanhoController.value = tamanho);
  }

  // RESTRIÇÃO ALIMENTAR
  int restricao;
  var _restricaoController = BehaviorSubject<int>.seeded(0);
  Stream<int> get outRestricao => _restricaoController.stream;
  Sink<int> get inRestricao => _restricaoController.sink;

  void setRestricao(int value) {
    this.restricao = value;
    inRestricao.add(_restricaoController.value = value);
  }

  @override
  void dispose() {
    _kitController.close();
    _tamanhoController.close();
    _restricaoController.close();
    super.dispose();
  }
}