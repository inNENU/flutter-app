import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class CarouselTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Carousel 测试'),
      ),
      body: ListView(children: const [
        TitleComponent('轮播图'),
        CarouselComponent([
          'https://mp.innenu.com/img/check/check1.jpg',
          'https://mp.innenu.com/img/check/check2.jpg',
          'https://mp.innenu.com/img/check/check3.jpg',
        ]),
        TitleComponent('高度为300的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          height: 300,
        ),
        TitleComponent('不自动播放的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          autoplay: false,
        ),
        TitleComponent('切换间隔为1s的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          interval: 1000,
        ),
        TitleComponent('切换动画为2s的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          duration: 3000,
        ),
        TitleComponent('竖向的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          vertical: true,
        ),
        TitleComponent('不衔接滚动的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/check/check1.jpg',
            'https://mp.innenu.com/img/check/check2.jpg',
            'https://mp.innenu.com/img/check/check3.jpg',
          ],
          circular: false,
        ),
      ]));
}
