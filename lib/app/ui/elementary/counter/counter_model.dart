import 'package:elementary/elementary.dart';

class CounterScreenModel extends ElementaryModel {
  int? counter;

  CounterScreenModel({int? initValue}) {
    if (initValue != null) {
      counter = initValue;
    }
  }

  int increment() {
    if (counter == null) {
      counter = 1;
      return counter!;
    }
    counter = counter! + 1;
    return counter!;
  }

  int decrement() {
    if (counter == null) {
      counter = -1;
      return counter!;
    }
    counter = counter! - 1;
    return counter!;
  }
}
