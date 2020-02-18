import 'package:cached_network_image/cached_network_image.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'image.g.dart';

@JsonSerializable()
class MyImage extends StatelessWidget {
  /// 图片地址
  @JsonKey(defaultValue: '')
  final String src;

  /// 描述文字
  final String desc;

  MyImage(this.src, [this.desc]);
  factory MyImage.fromJson(Map<String, dynamic> json) =>
      _$MyImageFromJson(json);

  Map<String, dynamic> toJson() => _$MyImageToJson(this);

  /// 加载组件
  Widget get _placeHolderWidget => Column(
        children: [
          const SizedBox(height: 40),
          const CircularProgressIndicator(),
          const SizedBox(height: 40),
        ],
      );

  /// 错误组件
  Widget get _errorWidget => Column(
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.error,
            color: Colors.red,
            size: 24,
          ),
          const Text(
            '图片加载失败',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 20),
        ],
      );

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: src,
            placeholder: (context, url) => _placeHolderWidget,
            errorWidget: (context, url, error) => _errorWidget,
          ),
        ),
      );
}
