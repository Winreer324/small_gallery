import 'dart:math' as math;import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:small_gallery/app/resources/app_icons.dart';import 'package:small_gallery/app/resources/app_colors.dart';class AnimationLoader extends StatefulWidget {  final String path;  final Color color;  final double? valueRotate;  final bool showIndeterminateIndicator;  const AnimationLoader({    Key? key,    this.path = AppIcons.loaderSvg,    this.color = AppColors.lightGray,    this.valueRotate,    this.showIndeterminateIndicator = false,  }) : super(key: key);  @override  _AnimationLoaderState createState() => _AnimationLoaderState();}class _AnimationLoaderState extends State<AnimationLoader> with TickerProviderStateMixin {  static const double _size = 45.0;  late final AnimationController animationController;  @override  void initState() {    animationController = AnimationController(      vsync: this,      duration: const Duration(seconds: 2),    );    if (!_isRotateIndicator) {      animationController.repeat();    }    super.initState();  }  bool get _isRotateIndicator => widget.valueRotate != null;  @override  void dispose() {    animationController.dispose();    super.dispose();  }  @override  void didUpdateWidget(covariant AnimationLoader oldWidget) {    super.didUpdateWidget(oldWidget);    if (widget.showIndeterminateIndicator) {      animationController.repeat();    } else {      if (_isRotateIndicator) {        animationController.animateTo(          widget.valueRotate ?? 0,          curve: Curves.bounceIn,          duration: Duration.zero,        );      }    }  }  @override  Widget build(BuildContext context) {    /// https://youtu.be/ccQpwKlZWsM?t=7080 -> use RepaintBoundary    return RepaintBoundary(      child: AnimatedBuilder(        animation: animationController,        child: SizedBox(          height: _size,          width: _size,          child: SvgPicture.asset(            widget.path,            color: widget.color,            width: _size,            height: _size,            matchTextDirection: true,          ),        ),        builder: (BuildContext context, Widget? _widget) {          return Transform.rotate(            angle: animationController.value * 2.0 * math.pi,            child: _widget,          );        },      ),    );  }}