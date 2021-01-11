import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    @required this.title,
    @required this.url,
    Key key,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) => FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (context, snapshot) => WillPopScope(
            onWillPop: () async {
              if (snapshot.hasData) {
                final canGoBack = await snapshot.data.canGoBack();
                if (canGoBack) {
                  // 网页可以返回时，优先返回上一页
                  await snapshot.data.goBack();
                  return Future.value(false);
                }
              }
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            ),
          ));
}
