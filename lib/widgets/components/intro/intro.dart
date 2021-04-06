import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'intro.g.dart';

/// 标题组件
@JsonSerializable()
class IntroComponent extends StatelessWidget {
  const IntroComponent(this.name, this.logo, {this.desc = ''});

  factory IntroComponent.fromJson(Map<String, dynamic> json) =>
      _$IntroComponentFromJson(json);

  /// 主体名称
  final String name;

  /// 主体 logo
  final String logo;

  /// 简介文字
  @JsonKey(defaultValue: '')
  final String desc;

  Map<String, dynamic> toJson() => _$IntroComponentToJson(this);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: logo,
                fit: BoxFit.cover,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: logo,
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(name,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Text(desc, style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            )
          ],
        ),
      );
}
