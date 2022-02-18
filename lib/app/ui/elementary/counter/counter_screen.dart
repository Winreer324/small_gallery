import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:small_gallery/app/ui/elementary/counter/counter_wm.dart';

class CounterScreen extends ElementaryWidget<ICounterWm> {
  const CounterScreen({
    Key? key,
    WidgetModelFactory<CounterScreenWM> wmFactory = createCounterScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICounterWm wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        elevation: 0,
      ),
      body: EntityStateNotifierBuilder<int?>(
        listenableEntityState: wm.currentCounter,
        errorBuilder: (_, __, ___) {
          return const SizedBox();
        },
        loadingBuilder: (_, __) {
          return const SizedBox();
        },
        builder: (_, data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'count $data',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: wm.incrementPressed,
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: wm.decrementPressed,
                    icon: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
