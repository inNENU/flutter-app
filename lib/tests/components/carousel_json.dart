import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class CarouselJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Carousel JSON 测试'),
      ),
      body: ListView(children: [
        MyTitle('轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ]
        }),
        MyTitle('高度为300的轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'height': 300,
        }),
        MyTitle('不自动播放的轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'autoplay': false,
        }),
        MyTitle('切换间隔为1s的轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'interval': 1000,
        }),
        MyTitle('切换动画为2s的轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'duration': 3000,
        }),
        MyTitle('竖向的轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'vertical': true,
        }),
        MyTitle('不衔接滚动的轮播图'),
        MyCarousel.fromJson(<String, dynamic>{
          'url': [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          'circular': false,
        }),
      ]));
}
