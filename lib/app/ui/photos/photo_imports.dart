library photos;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';
import 'package:small_gallery/app/resources/app_text_styles.dart';
import 'package:small_gallery/app/ui/details_photo/details_photo.dart';
import 'package:small_gallery/app/ui/photos/bloc/photo_bloc.dart';
import 'package:small_gallery/app/ui/widgets/pagination_widget.dart';
import 'package:small_gallery/app/ui/widgets/placeholder_lost_internet_connect.dart';
import 'package:small_gallery/app/ui/widgets/progress_indicatior.dart';
import 'package:small_gallery/app/ui/widgets/refresh_widget/cubit/refresh_cubit.dart';
import 'package:small_gallery/app/ui/widgets/refresh_widget/widgets/refresh_widget.dart';
import 'package:small_gallery/domain/entity/photo_entity.dart';
import 'package:small_gallery/domain/enum/type_photo.dart';
import 'package:small_gallery/gateway/extensions/type_photo_extensions.dart';

part 'photo_screen.dart';

part 'widgets/photo_item.dart';

part 'widgets/photo_list.dart';
