import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  /// 图片地址
  final String src;

  MyImage(this.src);
  MyImage.fromJson(config) : src = config.src;

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        placeholder: (context, url) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CircularProgressIndicator(),
        ),
        imageUrl: widget.src,
      );
}
