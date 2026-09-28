import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbeddedWebContent extends StatefulWidget {
  const EmbeddedWebContent({
    super.key,
    required this.height,
    required this.openExternally,
    this.uri,
    this.html,
  }) : assert(uri != null || html != null);

  final double height;
  final Uri? uri;
  final String? html;
  final VoidCallback openExternally;

  @override
  State<EmbeddedWebContent> createState() => _EmbeddedWebContentState();
}

class _EmbeddedWebContentState extends State<EmbeddedWebContent> {
  WebViewController? _controller;

  bool get _supportsWebView =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  void initState() {
    super.initState();
    if (_supportsWebView) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white);
      _loadContent();
    }
  }

  void _loadContent() {
    final controller = _controller!;
    if (widget.html != null) {
      controller.loadHtmlString(
        widget.html!,
        baseUrl: 'https://inzaghi.wuaze.com',
      );
    } else {
      controller.loadRequest(widget.uri!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) {
      return Container(
        height: widget.height,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFFF5F6F8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.open_in_browser, size: 32, color: Colors.black54),
            const SizedBox(height: 8),
            const Text(
              'Embedded content is available in the Android and iOS apps.',
              textAlign: TextAlign.center,
            ),
            TextButton.icon(
              onPressed: widget.openExternally,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open in browser'),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
