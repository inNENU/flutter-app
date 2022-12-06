import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class CarouselTest extends StatelessWidget {
  const CarouselTest({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Carousel 测试'),
      ),
      body: ListView(children: const [
        TitleComponent('轮播图'),
        CarouselComponent([
          'https://mp.innenu.com/img/arrival/pickup.jpg',
          'https://mp.innenu.com/img/check/benbu.jpg',
          'https://mp.innenu.com/img/check/jingyue.jpg',
        ]),
        TitleComponent('高度为300的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          height: 300,
        ),
        TitleComponent('不自动播放的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          autoplay: false,
        ),
        TitleComponent('切换间隔为1s的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          interval: 1000,
        ),
        TitleComponent('切换动画为2s的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          duration: 3000,
        ),
        TitleComponent('竖向的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          vertical: true,
        ),
        TitleComponent('不衔接滚动的轮播图'),
        CarouselComponent(
          [
            'https://mp.innenu.com/img/arrival/pickup.jpg',
            'https://mp.innenu.com/img/check/benbu.jpg',
            'https://mp.innenu.com/img/check/jingyue.jpg',
          ],
          circular: false,
        ),
      ]));
}
