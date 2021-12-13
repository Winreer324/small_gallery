library gateway;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

export 'package:dio/dio.dart';
export 'package:domain/domain.dart';

part 'src/api/http_photo_gateway.dart';
part 'src/base/base_dio_request.dart';
part 'src/exception/exception.dart';
part 'src/extension/type_photo_extensions.dart';
part 'src/helpers/internet_connection.dart';
part 'src/helpers/network_info.dart';
part 'src/resources/gateway_constants.dart';
