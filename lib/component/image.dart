import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyImage extends StatefulWidget {
  final String src;

  MyImage({@required this.src});

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        placeholder: (context, url) => CircularProgressIndicator(),
        imageUrl: widget.src,
      );
}
