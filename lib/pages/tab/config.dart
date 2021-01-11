import 'package:flutter/material.dart';

/// 导航栏配置
class NavigationBarConfig {
  NavigationBarConfig(this.widget, {this.label, this.icon}) {
    bottomNavigationBarItem = BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

  /// 对应的标题
  String label;

  /// 对应的标题
  Widget icon;

  /// 对应的页面
  Widget widget;

  /// 对应的导航栏项配置
  BottomNavigationBarItem bottomNavigationBarItem;
}
