import 'package:cached_network_image/cached_network_image.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'image.g.dart';

@JsonSerializable()
class MyImage extends StatefulWidget {
  /// 图片地址
  @JsonKey(required: true)
  final String src;

  MyImage(this.src);
  factory MyImage.fromJson(Map<String, dynamic> json) =>
      _$MyImageFromJson(json);

  Map<String, dynamic> toJson() => _$MyImageToJson(this);

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: widget.src,

            // 加载组件
            placeholder: (context, url) => Column(
              children: [
                const SizedBox(height: 40),
                const CircularProgressIndicator(),
                const SizedBox(height: 40),
              ],
            ),

            // 错误组件
            errorWidget: (context, url, error) => Column(
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
            ),
          ),
        ),
      );
}
