import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';


class BlocGlobal extends BlocBase {

  
  String hash;
  final hashController = BehaviorSubject.seeded('');
  Stream<String> get outHash => hashController.stream;
  Sink<String> get inHash => hashController.sink;

  void setHash(String password) {
    inHash.add(hashController.value);
  }
  
  @override
  void dispose() {
    hashController.close();
    super.dispose();
  }

}