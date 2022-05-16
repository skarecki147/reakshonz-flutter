import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Play extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: WebView(
            initialUrl: 'assets/gameplay/index.html', // TODO - extend the plugin to use file assets ->
            // https://medium.com/flutter-community/loading-local-assets-in-webview-in-flutter-b95aebd6edad 
            javascriptMode: JavascriptMode.unrestricted),
      );
}
// TURBO