import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  final String? url;
  const WebScreen({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: WebView(
        zoomEnabled: true,
        
        initialUrl: "$url",
      ),
    );
  }
}
