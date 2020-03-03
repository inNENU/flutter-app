// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCarousel _$MyCarouselFromJson(Map<String, dynamic> json) {
  return MyCarousel(
    MyCarousel._getImagesFromJson(json['url'] as List),
    height: (json['height'] as num)?.toDouble(),
    autoplay: json['autoplay'] as bool ?? true,
    interval: json['interval'] as int ?? 5000,
    duration: json['duration'] as int ?? 500,
    circular: json['circular'] as bool ?? true,
    vertical: json['vertical'] as bool ?? false,
  );
}

Map<String, dynamic> _$MyCarouselToJson(MyCarousel instance) =>
    <String, dynamic>{
      'url': instance.images,
      'height': instance.height,
      'autoplay': instance.autoplay,
      'interval': instance.interval,
      'duration': instance.duration,
      'circular': instance.circular,
      'vertical': instance.vertical,
    };
