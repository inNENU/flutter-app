import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

/// 组件
@JsonSerializable()
class CardComponent extends StatelessWidget {
  // TODO(Mister-Hope): add type support
  const CardComponent(
      {required this.cover,
      required this.title,
      required this.url,
      this.desc = '',
      this.name = '',
      this.logo = ''});

  factory CardComponent.fromJson(Map<String, dynamic> json) =>
      _$CardComponentFromJson(json);

  /// 卡片标题
  final String title;

  /// 卡片详情
  @JsonKey(defaultValue: '')
  final String desc;

  /// 卡片图片地址
  final String cover;

  /// 卡片跳转路径
  final String url;

  /// 卡片 logo 名称
  @JsonKey(defaultValue: '')
  final String name;

  /// 卡片 logo 地址
  @JsonKey(defaultValue: '')
  final String logo;

  Map<String, dynamic> toJson() => _$CardComponentToJson(this);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(imageUrl: cover, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        if (desc != '')
                          Text(
                            desc,
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                      ],
                    ),
                  ),
                  if (logo != '')
                    Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          width: 28,
                          imageUrl: logo,
                        ),
                        if (name != '')
                          Text(
                            name,
                            style: Theme.of(context).textTheme.caption,
                          )
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ));
}
