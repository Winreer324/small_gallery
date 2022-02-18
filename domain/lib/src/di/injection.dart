import 'package:domain/src/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
GetIt setInjectionsDomain(GetIt _injection, {String? environment}) => $initGetIt(
      _injection,
      environment: environment,
    );
