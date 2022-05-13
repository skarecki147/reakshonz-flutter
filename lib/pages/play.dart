
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Play extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: WebView(
            initialUrl: 'assets/gameplay/index.html',
            javascriptMode: JavascriptMode.unrestricted),
      );
}
// TURBO