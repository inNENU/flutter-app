import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class GridTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Grid 测试'),
      ),
      body: ListView(
        children: [
          MyGrid([
            MyGridConfig(text: '网格项1'),
            MyGridConfig(text: '网格项2'),
            MyGridConfig(text: '网格项3'),
            MyGridConfig(text: '网格项4'),
          ]),
          MyGrid(
            [
              MyGridConfig(text: '网格项1'),
              MyGridConfig(text: '网格项2'),
              MyGridConfig(text: '网格项3'),
              MyGridConfig(text: '网格项4'),
            ],
            head: '网格标题',
            foot: '网格脚注',
          ),
          MyGrid(
            [
              MyGridConfig(
                icon: '/module/icon/score.svg',
                text: 'Head 测试',
                url: '/test/head',
              ),
              MyGridConfig(
                icon: '/module/icon/score.svg',
                text: 'Title 测试',
                url: '/test/title',
              ),
              MyGridConfig(
                icon: '/module/icon/score.svg',
                text: 'List 测试',
                url: '/test/list',
              ),
              MyGridConfig(
                icon: '/module/icon/score.svg',
                text: 'Image 测试',
                url: '/test/image',
              ),
              MyGridConfig(
                icon: '/module/icon/score.svg',
                text: 'Foot 测试',
                url: '/test/foot',
              ),
            ],
            head: '网格标题',
            foot: '网格脚注',
          ),
        ],
      ));
}
