import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:small_gallery/app/di/injection.config.dart';

GetIt injection = GetIt.I;

@injectableInit
void setInjectionsApp(GetIt _injection, {String? environment}) => $initGetIt(
      _injection,
      environment: environment,
    );
