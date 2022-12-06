import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:innenu/utils/json_tools.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carousel.g.dart';

/// 标题组件
@JsonSerializable()
class CarouselComponent extends StatelessWidget {
  // TODO(Mister-Hope): add support for 'fill'
  const CarouselComponent(
    this.images, {
    this.height,
    this.autoplay = true,
    this.interval = 5000,
    this.duration = 500,
    this.circular = true,
    this.vertical = false,
    super.key,
  });
  factory CarouselComponent.fromJson(Map<String, dynamic> json) =>
      _$CarouselComponentFromJson(json);

  /// 轮播图片
  final List<String> images;

  /// 轮播图组件高度
  final double? height;

  /// 自动播放
  final bool autoplay;

  /// 自动切换时间间隔，单位 ms
  final int interval;

  /// 滑动动画时长，单位 ms
  final int duration;

  /// 是否采用衔接滑动
  final bool circular;

  /// 滑动方向是否为纵向
  final bool vertical;

  Map<String, dynamic> toJson() => _$CarouselComponentToJson(this);

  @override
  Widget build(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          height: height == 0 ? null : height,
          viewportFraction: 0.9,
          autoPlay: autoplay,
          autoPlayInterval: Duration(milliseconds: interval),
          autoPlayAnimationDuration: Duration(milliseconds: duration),
          scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
        ),
        items: images
            .map<Widget>(
              (link) => Builder(
                builder: (context) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CachedNetworkImage(
                    imageUrl: link,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => loadingWidget(),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
