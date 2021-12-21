import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/di/injection.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set di
  await setInjections();

  runZonedGuarded(() {
    runApp(const Gallery());
  }, (_, __) {});
}
