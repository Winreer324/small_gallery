import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'package:small_gallery/app/ui/widgets/refresh_widget/cubit/refresh_cubit.dart';

import '../../animation_loader.dart';
import '../../custom_refresh_indicator.dart';

class RefreshWidget extends StatefulWidget {
  final Function() callRefresh;
  final Widget child;
  final bool isLoading;
  final ScrollController scrollController;

  const RefreshWidget({
    Key? key,
    required this.callRefresh,
    required this.scrollController,
    required this.child,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  Completer<void>? _refreshCompleter;

  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RefreshCubit, RefreshState>(
      listener: (context, state) {
        if (state is RefreshStatus) {
          if (!state.isLoading) {
            _updateRefresh();
          }
        }
      },
      child: CustomRefreshIndicator(
        onRefresh: () async {
          widget.callRefresh();
          return _refreshCompleter?.future ?? Future.value();
        },
        builderHeader: (_, value, showIndeterminateIndicator) {
          return AnimationLoader(
            color: AppColors.baseColor,
            valueRotate: value,
            showIndeterminateIndicator: showIndeterminateIndicator,
          );
        },
        child: widget.child,
      ),
    );
  }

  void _updateRefresh() {
    if (mounted) {
      setState(() {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      });
    }
  }
}
