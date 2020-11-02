import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nav.g.dart';

@JsonSerializable()
class NavComponent extends StatelessWidget {
  /// 页面标题
  final String title;

  NavComponent(this.title);
  factory NavComponent.fromJson(Map<String, dynamic> json) =>
      _$NavComponentFromJson(json);

  Map<String, dynamic> toJson() => _$NavComponentToJson(this);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title),
      );
}
