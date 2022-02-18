import 'package:gateway/src/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
void setInjectionsGateway(GetIt _injection, {String? environment}) => $initGetIt(
      _injection,
      environment: environment,
    );
