import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../jsonTools.dart';

part 'carousel.g.dart';

/// 标题组件
@JsonSerializable()
class MyCarousel extends StatelessWidget {
  /// 轮播图片
  @JsonKey(name: 'url', fromJson: _getImagesFromJson)
  final List<String> images;

  /// 轮播图组件高度
  final double height;

  /// 自动播放
  @JsonKey(defaultValue: true)
  final bool autoplay;

  /// 自动切换时间间隔，单位 ms
  @JsonKey(defaultValue: 5000)
  final int interval;

  /// 滑动动画时长，单位 ms
  @JsonKey(defaultValue: 500)
  final int duration;

  /// 是否采用衔接滑动
  @JsonKey(defaultValue: true)
  final bool circular;

  /// 滑动方向是否为纵向
  @JsonKey(defaultValue: false)
  final bool vertical;

  MyCarousel(
    this.images, {
    this.height = 200,
    this.autoplay = true,
    this.interval = 5000,
    this.duration = 500,
    this.circular = true,
    this.vertical = false,
  });
  factory MyCarousel.fromJson(Map<String, dynamic> json) =>
      _$MyCarouselFromJson(json);
  Map<String, dynamic> toJson() => _$MyCarouselToJson(this);

  /// 从 JSON 中获得图片
  static List<String> _getImagesFromJson(List<dynamic> url) =>
      url.map((dynamic item) => item.toString()).toList();

  @override
  Widget build(BuildContext context) => CarouselSlider(
        height: height,
        items: images
            .map<Widget>(
              (link) => Builder(
                builder: (context) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CachedNetworkImage(
                    imageUrl: link,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => JSONTools.loadingWidget(),
                  ),
                ),
              ),
            )
            .toList(),
        viewportFraction: 0.9,
        enableInfiniteScroll: true,
        autoPlay: autoplay,
        autoPlayInterval: Duration(milliseconds: interval),
        scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
        autoPlayAnimationDuration: Duration(milliseconds: duration),
      );
}
