import 'package:flutter/foundation.dart';

class NumManagerBloc extends ChangeNotifier {
  int number = 0;

  void increment() {
    this.number++;
    notifyListeners();
  }
}
