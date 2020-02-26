// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCarousel _$MyCarouselFromJson(Map<String, dynamic> json) {
  return MyCarousel(
    MyCarousel._getImagesFromJson(json['url'] as List),
    height: (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MyCarouselToJson(MyCarousel instance) =>
    <String, dynamic>{
      'url': instance.images,
      'height': instance.height,
    };
