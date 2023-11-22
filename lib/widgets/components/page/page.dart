import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:innenu/widgets/components/components.dart';
import 'package:logging/logging.dart';

final _logger = Logger('page');

class MyPage extends StatelessWidget {
  const MyPage({
    required this.config,
    required this.title,
    required List<Widget> children,
    super.key,
  }) : pageWidgets = children;

  MyPage.fromId({super.key})
      : title = '加载中',
        config = loadingPageConfig,
        pageWidgets = [loadingPageWidgets];

  /// 从 JSON 生成 MyPage
  MyPage.fromJson(this.config, {super.key})
      : title = _getTitle(config['title'] as String?,
            hidden: config['hidden'] as bool?),
        pageWidgets = _generateContent(config['content'] as List<dynamic>?);

  /// 页面配置
  final Map<String, dynamic> config;

  /// 页面标题
  final String title;

  /// 页面组件
  final List<Widget> pageWidgets;

  static final loadingPageConfig = <String, dynamic>{
    'title': '加载中',
    'content': <void>[]
  };

  static const loadingPageWidgets = SizedBox(
    width: 28.0,
    height: 28.0,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 2.5,
    ),
  );

  static String _getTitle(String? title, {bool? hidden = false}) =>
      (hidden ?? false) ? '' : title ?? 'in东师';

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
      case 'carousel':
        return CarouselComponent.fromJson(config);
      case 'doc':
        return DocComponent.fromJson(config);
      case 'card':
        return CardComponent.fromJson(config);
      case 'copy':
        return ActionComponent.fromJson(config);
      case 'account':
        return AccountComponent.fromJson(config);

      case 'advanced-ist':
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

  static List<Widget> _generateContent(List<dynamic>? content) {
    final config = content ?? <Map<String, dynamic>>[];

    return List<Widget>.generate(config.length,
        (index) => _generateWidget(config[index] as Map<String, dynamic>));
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

class OnlinePage extends StatelessWidget {
  const OnlinePage(
    this.id, {
    super.key,
  });

  /// 页面 id
  final String id;

  static Future<Map<String, dynamic>> getPageConfig(String id) =>
      Dio().get<String>('https://mp.innenu.com/r/$id.json').then((response) {
        if (response.statusCode == 200) {
          return json.decode(response.data ?? '{}') as Map<String, dynamic>;
        }

        _logger
            .warning('Request failed with statusCode: ${response.statusCode}');

        return <String, dynamic>{
          'title': '加载错误',
          'content': <void>[],
        };
      });

  static String _getTitle(String? title, {bool? hidden = false}) =>
      (hidden ?? false) ? '' : title ?? 'in东师';

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
      case 'carousel':
        return CarouselComponent.fromJson(config);
      case 'doc':
        return DocComponent.fromJson(config);
      case 'card':
        return CardComponent.fromJson(config);
      case 'copy':
        return ActionComponent.fromJson(config);
      case 'account':
        return AccountComponent.fromJson(config);

      case 'advanced-ist':
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

  static List<Widget> _generateContent(List<dynamic>? content) {
    final config = content ?? <Map<String, dynamic>>[];

    return List<Widget>.generate(config.length,
        (index) => _generateWidget(config[index] as Map<String, dynamic>));
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Map<String, dynamic>>(
        future: getPageConfig(id),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Scaffold(
                appBar: AppBar(
                  title: const Text('加载错误'),
                ),
              );
            } else {
              final title = _getTitle(
                  (snapshot.data as Map<String, dynamic>)['title'] as String?);
              final pageWidgets = _generateContent((snapshot.data
                  as Map<String, dynamic>)['content'] as List<dynamic>?);

              // 请求成功，显示数据
              return Scaffold(
                  appBar: title.isNotEmpty
                      ? AppBar(
                          title: Text(title),
                        )
                      : null,
                  body: ListView(
                    children: [
                      ...pageWidgets,
                      FooterComponent.fromJson(
                          snapshot.data as Map<String, dynamic>)
                    ],
                  ));
            }
          } else {
            // 请求未结束，显示 loading
            return Scaffold(
                appBar: AppBar(
                  title: const Text('加载中'),
                ),
                body: ListView(
                  children: const [
                    SizedBox(
                      width: 28.0,
                      height: 28.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 2.5,
                      ),
                    )
                  ],
                ));
          }
        },
      );
}
