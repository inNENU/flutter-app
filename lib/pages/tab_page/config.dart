import 'package:flutter/material.dart';

/// 导航栏配置
class NavigationBarConfig {
  /// 对应的标题
  Text title;

  /// 对应的标题
  Widget icon;

  /// 对应的页面
  Widget widget;

  /// 对应的导航栏项配置
  BottomNavigationBarItem bottomNavigationBarItem;

  /// 更新页面
  void update(Widget page) {
    widget = page;
  }

  NavigationBarConfig(this.widget, {String title, this.icon}) {
    this.title = Text(title);
    bottomNavigationBarItem = BottomNavigationBarItem(
      icon: icon,
      title: this.title,
    );
  }
}
