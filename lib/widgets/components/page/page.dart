import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'package:innenu/widgets/components/components.dart';

final _logger = Logger('page');

class MyPage extends StatelessWidget {
  const MyPage({
    required this.config,
    required this.title,
    required List<Widget> children,
  }) : pageWidgets = children;

  /// 从 JSON 生成 MyPage
  MyPage.fromJson(this.config)
      : title = (config['hidden'] as bool?) ?? false
            ? ''
            : config['title'] as String? ?? 'in东师',
        pageWidgets = List<Widget>.generate(
            (config['content'] as List<dynamic>).length,
            (index) => _generateWidget(
                config['content'][index] as Map<String, dynamic>));

  /// 页面配置
  final Map<String, dynamic> config;

  /// 页面标题
  final String title;

  /// 页面组件
  final List<Widget> pageWidgets;

  /// 生成 Widget
  static Widget _generateWidget(Map<String, dynamic> config) {
    final tag = config['tag'] as String;

    switch (tag) {
      case 'title':
        return TitleComponent.fromJson(config);
      case 'text':
      case 'ul':
      case 'ol':
      case 'p':
        return TextComponent.fromJson(config);
      case 'img':
        return ImageComponent.fromJson(config);
      case 'grid':
        return GridComponent.fromJson(config);
      case 'list':
        return ListComponent.fromJson(config);
      case 'footer':
        return FooterComponent.fromJson(config);
      case 'phone':
        return PhoneComponent.fromJson(config);
      case 'swiper':
        return CarouselComponent.fromJson(config);
      case 'doc':
        return DocComponent.fromJson(config);
      case 'card':
        return CardComponent.fromJson(config);
      case 'intro':
        return IntroComponent.fromJson(config);

      case 'advanced-ist':
      // TODO(Mister-Hope): add copy component
      case 'copy':
      case 'media':
        _logger.info('$tag component support is on the way.');
        return Text(
          '暂不支持的组件 $tag',
          textAlign: TextAlign.center,
        );

      default:
        _logger.warning('Unknown component: $tag');
        return Text(
          '暂不支持的组件 $tag',
          textAlign: TextAlign.center,
        );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: title.isNotEmpty
          ? AppBar(
              title: Text(title),
            )
          : null,
      body: ListView(
        children: [...pageWidgets, FooterComponent.fromJson(config)],
      ));
}
