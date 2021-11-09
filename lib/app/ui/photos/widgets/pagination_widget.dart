import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_gallery/app/ui/photos/bloc/photo_bloc.dart';

class PaginationWidget extends StatefulWidget {
  final ScrollController scrollController;
  final Widget child;

  const PaginationWidget({Key? key, required this.scrollController, required this.child}) : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = widget.scrollController;
    _scrollController.addListener(() {
      if (mounted) {
        if (_scrollController.offset == _scrollController.position.maxScrollExtent &&
            !context.read<PhotoBloc>().isPaginationLoading) {
          context.read<PhotoBloc>()
            ..isPaginationLoading = true
            ..add(PhotoFetch());
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
