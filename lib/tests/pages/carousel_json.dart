import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class CarouselJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Carousel JSON 测试'),
      ),
      body: ListView(children: [
        const TitleComponent('轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ]
        }),
        const TitleComponent('高度为300的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'height': 300,
        }),
        const TitleComponent('不自动播放的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'autoplay': false,
        }),
        const TitleComponent('切换间隔为1s的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'interval': 1000,
        }),
        const TitleComponent('切换动画为2s的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'duration': 3000,
        }),
        const TitleComponent('竖向的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'vertical': true,
        }),
        const TitleComponent('不衔接滚动的轮播图'),
        CarouselComponent.fromJson(const <String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'circular': false,
        }),
      ]));
}
