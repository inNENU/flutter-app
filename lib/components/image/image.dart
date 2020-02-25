import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

part 'image.g.dart';

final _logger = Logger('component.image');

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
  Widget _imageWidget(
    BuildContext context,
    ImageProvider<dynamic> imageProvider,
  ) =>
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Image(
          image: imageProvider,
        ),
      );

  /// 详情图片组件
  Widget _descImageWidget(
    BuildContext context,
    ImageProvider<dynamic> imageProvider,
    String desc,
  ) =>
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _imageWidget(context, imageProvider),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
          ),
        ],
      );

  /// Image Builder
  Widget _imageBuilder(BuildContext context,
          ImageProvider<dynamic> imageProvider, String desc) =>
      desc == null
          ? _imageWidget(context, imageProvider)
          : _descImageWidget(context, imageProvider, desc);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: CachedNetworkImage(
          imageUrl: src,
          imageBuilder: (context, imageBuilder) =>
              _imageBuilder(context, imageBuilder, desc),
          placeholder: (context, url) => _placeHolderWidget,
          errorWidget: (context, url, error) {
            _logger.warning('Image: load $url fail.');
            return _errorWidget(context);
          },
        ),
      );
}
