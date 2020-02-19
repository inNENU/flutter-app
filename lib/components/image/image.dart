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
  Widget _errorWidget(BuildContext context) => Column(
        children: [
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning,
                color: Colors.yellow,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '图片加载失败',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
        ],
      );

  /// 图片组件
  Widget _imageWidget(BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: CachedNetworkImage(
          imageUrl: src,
          placeholder: (context, url) => _placeHolderWidget,
          errorWidget: (context, url, error) {
            // TODO: Error log here
            return _errorWidget(context);
          },
        ),
      );

  /// 描述图片组件
  Widget _descImageWidget(BuildContext context) => CachedNetworkImage(
        imageUrl: src,
        imageBuilder: (context, imageProvider) => Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: imageProvider,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black45
                  ],
                ),
              ),
              child: Text(
                desc,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        placeholder: (context, url) => _placeHolderWidget,
        errorWidget: (context, url, error) {
          // TODO: Error log here
          return _errorWidget(context);
        },
      );

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: desc == null ? _imageWidget(context) : _descImageWidget(context),
      );
}
