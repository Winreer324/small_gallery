library app;

import 'dart:async';
import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gateway/gateway.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/ui/navigation/photo_imports.dart';

part 'app/di/injection.dart';
part 'app/extensions/context_extensions.dart';
part 'app/extensions/photo_entity_extension.dart';
part 'app/resources/app_colors.dart';
part 'app/resources/app_const.dart';
part 'app/resources/app_icons.dart';
part 'app/resources/app_strings.dart';
part 'app/resources/app_text_styles.dart';
part 'app/resources/app_themes.dart';
part 'app/resources/app_widget_constants.dart';
part 'app_widget.dart';
part 'main.dart';
