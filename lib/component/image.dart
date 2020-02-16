import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  /// 图片地址
  final String src;

  MyImage(this.src);
  MyImage.fromJson(Map<String, String> config) : src = config['src'];

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: CachedNetworkImage(
          placeholder: (context, url) => Column(
            children: [
              SizedBox(height: 20),
              CircularProgressIndicator(),
              SizedBox(height: 20),
            ],
          ),
          imageUrl: widget.src,
        ),
      );
}
