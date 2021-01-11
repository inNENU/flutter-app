import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

import 'package:innenu/utils/json_tools.dart';

part 'image.g.dart';

final _logger = Logger('component.image');

@JsonSerializable()
class ImageComponent extends StatelessWidget {
  const ImageComponent(this.src, [this.desc]);
  factory ImageComponent.fromJson(Map<String, dynamic> json) =>
      _$ImageComponentFromJson(json);

  /// 图片地址
  @JsonKey(defaultValue: '')
  final String src;

  /// 描述文字
  final String desc;

  Map<String, dynamic> toJson() => _$ImageComponentToJson(this);

  /// 错误组件
  Widget _errorWidget(BuildContext context) => Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
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
          const SizedBox(height: 40),
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
                      .bodyText2
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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: CachedNetworkImage(
          imageUrl: src,
          imageBuilder: (context, imageBuilder) =>
              _imageBuilder(context, imageBuilder, desc),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              JSONTools.loadingProgressWidget(downloadProgress.progress),
          errorWidget: (context, url, dynamic error) {
            _logger.warning('Image: load $url fail.');
            return _errorWidget(context);
          },
        ),
      );
}
