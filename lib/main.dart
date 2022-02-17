import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gateway/gateway.dart';

import 'app/di/injection.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set di
  final getIt = setInjectionsDomain();
  setInjectionsGateway(getIt);
  setInjectionsApp(getIt);

  runZonedGuarded(() {
    runApp(Gallery());
  }, (_, __) {});
}
