import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  final _counterController = BehaviorSubject<int>.seeded(0);

  Stream<int> get counter => _counterController.stream;

  Function(int) get addCounter => _counterController.add;

  void increment() {
    var numero = ++_counterController.value;
    addCounter(numero);
  }

  @override
  void dispose() {
    _counterController.close();
    super.dispose();
  }
}
