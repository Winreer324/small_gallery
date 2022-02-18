import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gateway/gateway.dart';

import 'app/di/injection.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set di
  setInjectionsDomain(injection);
  setInjectionsGateway(injection);
  setInjectionsApp(injection);

  runZonedGuarded(() {
    runApp(const Gallery());
  }, (_, __) {});
}
