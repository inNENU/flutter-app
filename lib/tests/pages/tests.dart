import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class ComponentTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('组件测试'),
      ),
      body: ListView(
        children: [
          ListComponent(
            [
              ListComponentConfig('nav 测试', url: '/test/component/nav'),
              ListComponentConfig('title 测试', url: '/test/component/title'),
              ListComponentConfig('text 测试', url: '/test/component/text'),
              ListComponentConfig('image 测试', url: '/test/component/image'),
              ListComponentConfig('list 测试', url: '/test/component/list'),
              ListComponentConfig('grid 测试', url: '/test/component/grid'),
              ListComponentConfig('phone 测试', url: '/test/component/phone'),
              ListComponentConfig('doc 测试', url: '/test/component/doc'),
              ListComponentConfig('foot 测试', url: '/test/component/foot'),
              ListComponentConfig('carousel 测试',
                  url: '/test/component/carousel'),
              ListComponentConfig('MyPage 测试', path: 'card0'),
            ],
            header: 'Class 测试',
          ),
          ListComponent(
            [
              ListComponentConfig('nav 测试', url: '/test/component/navJSON'),
              ListComponentConfig('title 测试', url: '/test/component/titleJSON'),
              ListComponentConfig('text 测试', url: '/test/component/titleJSON'),
              ListComponentConfig('paragraph 测试',
                  url: '/test/component/textJSON'),
              ListComponentConfig('image 测试', url: '/test/component/imageJSON'),
              ListComponentConfig('list 测试', url: '/test/component/listJSON'),
              ListComponentConfig('grid 测试', url: '/test/component/gridJSON'),
              ListComponentConfig('foot 测试', url: '/test/component/footJSON'),
              ListComponentConfig('carousel 测试',
                  url: '/test/component/carouselJSON'),
              ListComponentConfig('MyPage 测试', path: 'card0'),
            ],
            header: 'JSON 测试',
          ),
        ],
      ));
}
