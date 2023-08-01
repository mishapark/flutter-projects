import 'package:flutter/material.dart';
import 'package:webview/ui/widgets/browser_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController _webController;
  final TextEditingController _textController = TextEditingController();
  bool isLoading = false;
  bool isForwardDisabled = true;
  bool isBackwardDisabled = true;

  @override
  void initState() {
    super.initState();
    final WebViewController controller = WebViewController();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onUrlChange: (UrlChange change) async {
            _textController.text = await _webController.currentUrl() ?? '';

            if (await _webController.canGoBack()) {
              setState(() {
                isBackwardDisabled = false;
              });
            } else {
              setState(() {
                isBackwardDisabled = true;
              });
            }
            if (await _webController.canGoForward()) {
              setState(() {
                isForwardDisabled = false;
              });
            } else {
              setState(() {
                isForwardDisabled = true;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse('https://google.com'));

    _webController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          BrowserBar(
            isBackwardDisabled: isBackwardDisabled,
            isForwardDisabled: isForwardDisabled,
            isLoading: isLoading,
            textController: _textController,
            webController: _webController,
          ),
          Expanded(
            child: WebViewWidget(controller: _webController),
          ),
        ],
      ),
    );
  }
}
