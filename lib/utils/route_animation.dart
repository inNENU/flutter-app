import 'package:flutter/material.dart';

/// 滑动页面导航
class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;
  SlidePageRoute(this.widget)
      : super(
            pageBuilder: (context, animation1, animation2) => widget,
            transitionsBuilder: (context, animation1, animation2, child) =>
                SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: const Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child,
                ));
}

/// 渐变页面导航
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;

  FadePageRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation1, animation2) => widget,
            transitionsBuilder: (context, animation1, animation2, child) =>
                FadeTransition(
                  opacity: Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child,
                ));
}

/// 缩放页面导航
class ZoomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;

  ZoomPageRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation1, animation2) => widget,
            transitionsBuilder: (context, animation1, animation2, child) =>
                ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child));
}

/// 旋转 + 缩放页面导航
class RotateZoomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;
  RotateZoomPageRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation1, animation2) => widget,
            transitionsBuilder: (context, animation1, animation2, child) =>
                RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: ScaleTransition(
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    )));
}
