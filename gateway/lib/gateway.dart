library gateway;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:alice/alice.dart';

export 'package:dio/dio.dart';
export 'package:domain/domain.dart';
export 'package:gateway/src/di/injection.dart';

part 'src/api/http_photo_gateway.dart';

part 'src/base/base_dio_request.dart';

part 'src/exception/exception.dart';

part 'src/extension/type_photo_extensions.dart';

part 'src/helpers/internet_connection.dart';

part 'src/helpers/network_info.dart';

part 'src/resources/gateway_constants.dart';
