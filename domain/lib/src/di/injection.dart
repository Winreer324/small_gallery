import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/src/di/injection.config.dart';

GetIt injection = GetIt.I;

@injectableInit
GetIt setInjectionsDomain({String? environment}) => $initGetIt(
      injection,
      environment: environment,
    );
