import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class GridTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Grid 测试'),
      ),
      body: ListView(
        children: [
          GridComponent([
            GridComponentConfig(text: '网格项1'),
            GridComponentConfig(text: '网格项2'),
            GridComponentConfig(text: '网格项3'),
            GridComponentConfig(text: '网格项4'),
          ]),
          GridComponent(
            [
              GridComponentConfig(text: '网格项1'),
              GridComponentConfig(text: '网格项2'),
              GridComponentConfig(text: '网格项3'),
              GridComponentConfig(text: '网格项4'),
            ],
            header: '网格标题',
            footer: '网格脚注',
          ),
          GridComponent(
            [
              GridComponentConfig(
                icon: '/module/icon/score.svg',
                text: 'Head 测试',
                url: '/test/head',
              ),
              GridComponentConfig(
                icon: '/module/icon/score.svg',
                text: 'Title 测试',
                url: '/test/title',
              ),
              GridComponentConfig(
                icon: '/module/icon/score.svg',
                text: 'List 测试',
                url: '/test/list',
              ),
              GridComponentConfig(
                icon: '/module/icon/score.svg',
                text: 'Image 测试',
                url: '/test/image',
              ),
              GridComponentConfig(
                icon: '/module/icon/score.svg',
                text: 'Foot 测试',
                url: '/test/foot',
              ),
            ],
            header: '网格标题',
            footer: '网格脚注',
          ),
        ],
      ));
}
