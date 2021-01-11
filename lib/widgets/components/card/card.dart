import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

/// 组件
@JsonSerializable()
class CardComponent extends StatelessWidget {
  const CardComponent(
      {this.title,
      this.desc = '',
      this.src,
      this.url,
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
  final String src;

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
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Card(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(imageUrl: src, fit: BoxFit.cover),
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
                        if (desc == '')
                          null
                        else
                          Text(
                            desc,
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                      ],
                    ),
                  ),
                  if (logo == '')
                    null
                  else
                    Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: logo,
                        ),
                        if (name == '')
                          null
                        else
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
