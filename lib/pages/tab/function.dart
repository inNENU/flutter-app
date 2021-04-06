import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';
import 'config.dart';

/// 功能页
NavigationBarConfig functionPageWidget = NavigationBarConfig(
  ListView(
    children: [
      ListComponent(
        [
          ListComponentConfig('textTheme', url: '/test/textTheme'),
        ],
        header: '展示项目',
      ),
      ListComponent(
        [
          ListComponentConfig('组件测试', url: '/test/component'),
          ListComponentConfig('Path 库测试', url: '/test/utils/path'),
        ],
        header: '测试列表',
      ),
    ],
  ),
  label: '功能大厅',
  icon: const Icon(Icons.apps),
);
