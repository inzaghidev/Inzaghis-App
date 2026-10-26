import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> openInAppWebPage(BuildContext context, Uri uri) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: (_) => InAppWebPage(uri: uri),
    ),
  );
}

class InAppWebPage extends StatefulWidget {
  const InAppWebPage({super.key, required this.uri});

  final Uri uri;

  @override
  State<InAppWebPage> createState() => _InAppWebPageState();
}

class _InAppWebPageState extends State<InAppWebPage> {
  late final WebViewController _controller;
  int _loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() => _loadingProgress = progress);
            }
          },
        ),
      )
      ..loadRequest(widget.uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.uri.host)),
      body: Column(
        children: [
          if (_loadingProgress < 100)
            LinearProgressIndicator(value: _loadingProgress / 100),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
