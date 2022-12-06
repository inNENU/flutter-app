import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class CarouselJSONTest extends StatelessWidget {
  const CarouselJSONTest({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Carousel JSON 测试'),
      ),
      body: ListView(children: [
        const TitleComponent('轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ]
        }),
        const TitleComponent('高度为300的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          'height': 300,
        }),
        const TitleComponent('不自动播放的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          'autoplay': false,
        }),
        const TitleComponent('切换间隔为1s的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          'interval': 1000,
        }),
        const TitleComponent('切换动画为2s的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          'duration': 3000,
        }),
        const TitleComponent('竖向的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          'vertical': true,
        }),
        const TitleComponent('不衔接滚动的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'images': [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          'circular': false,
        }),
      ]));
}
