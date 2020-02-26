import 'package:flutter/material.dart';

import '../components/index.dart';

class CarouselTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Carousel 测试'),
      ),
      body: ListView(children: [
        MyCarousel([
          'https://mp.innenu.com/img/check/check1.jpg',
          'https://mp.innenu.com/img/check/check2.jpg',
          'https://mp.innenu.com/img/check/check3.jpg',
        ]),
      ]));
}
