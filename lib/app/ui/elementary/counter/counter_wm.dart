import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:small_gallery/app/ui/elementary/counter/counter_model.dart';
import 'package:small_gallery/app/ui/elementary/counter/counter_screen.dart';

class CounterScreenWM extends WidgetModel<CounterScreen, CounterScreenModel> implements ICounterWm {
  late final EntityStateNotifier<int?> _currentCounter;

  CounterScreenWM(CounterScreenModel model) : super(model) {
    _currentCounter = EntityStateNotifier(EntityState.content(model.counter));
  }

  @override
  void decrementPressed() {
    _currentCounter.content(model.decrement());
  }

  @override
  void incrementPressed() {
    _currentCounter.content(model.increment());
  }

  @override
  ListenableState<EntityState<int?>> get currentCounter => _currentCounter;
}

CounterScreenWM createCounterScreenWM(BuildContext _) => CounterScreenWM(
      CounterScreenModel(initValue: 10),
    );

abstract class ICounterWm extends IWidgetModel {
  ListenableState<EntityState<int?>> get currentCounter;

  void incrementPressed();

  void decrementPressed();
}
