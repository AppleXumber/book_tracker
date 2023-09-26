import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<int> _weekDays = [1, 2, 3, 4, 5, 6, 7];
  List<int> get weekDays => _weekDays;
  set weekDays(List<int> _value) {
    _weekDays = _value;
  }

  void addToWeekDays(int _value) {
    _weekDays.add(_value);
  }

  void removeFromWeekDays(int _value) {
    _weekDays.remove(_value);
  }

  void removeAtIndexFromWeekDays(int _index) {
    _weekDays.removeAt(_index);
  }

  void updateWeekDaysAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _weekDays[_index] = updateFn(_weekDays[_index]);
  }

  void insertAtIndexInWeekDays(int _index, int _value) {
    _weekDays.insert(_index, _value);
  }

  List<int> _readings = [20, 21, 26, 17, 15, 30, 20];
  List<int> get readings => _readings;
  set readings(List<int> _value) {
    _readings = _value;
  }

  void addToReadings(int _value) {
    _readings.add(_value);
  }

  void removeFromReadings(int _value) {
    _readings.remove(_value);
  }

  void removeAtIndexFromReadings(int _index) {
    _readings.removeAt(_index);
  }

  void updateReadingsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _readings[_index] = updateFn(_readings[_index]);
  }

  void insertAtIndexInReadings(int _index, int _value) {
    _readings.insert(_index, _value);
  }

  String _sinopse =
      'Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos.\n\nEsta jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, como os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler para descobrir.\n\nLançado em 1937, O Hobbit é um divisor de águas na literatura de fantasia mundial. Mais de 80 anos após a sua publicação, o livro que antecede os ocorridos em O Senhor dos Anéis continua arrebatando fãs de todas as idades, talvez pelo seu tom brincalhão com uma pitada de magia élfica, ou talvez porque J.R.R. Tolkien tenha escrito o melhor livro infantojuvenil de todos os tempos.\n';
  String get sinopse => _sinopse;
  set sinopse(String _value) {
    _sinopse = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
