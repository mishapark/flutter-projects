import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserBar extends StatelessWidget {
  final bool isBackwardDisabled;
  final bool isForwardDisabled;
  final bool isLoading;
  final WebViewController webController;
  final TextEditingController textController;

  const BrowserBar({
    super.key,
    required this.isBackwardDisabled,
    required this.isForwardDisabled,
    required this.isLoading,
    required this.webController,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          constraints: const BoxConstraints(maxWidth: 35),
          iconSize: 20,
          splashRadius: 15,
          onPressed: isBackwardDisabled
              ? null
              : () async {
                  if (await webController.canGoBack()) {
                    webController.goBack();
                  }
                },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          constraints: const BoxConstraints(maxWidth: 35),
          iconSize: 20,
          splashRadius: 15,
          onPressed: isForwardDisabled
              ? null
              : () async {
                  if (await webController.canGoForward()) {
                    webController.goForward();
                  }
                },
        ),
        IconButton(
          icon: isLoading ? const Icon(Icons.clear) : const Icon(Icons.refresh),
          constraints: const BoxConstraints(maxWidth: 35),
          iconSize: 20,
          splashRadius: 15,
          onPressed: () {
            isLoading
                ? webController.runJavaScript('window.stop();')
                : webController.reload();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
            child: TextField(
              controller: textController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () => textController.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: textController.value.text.length),
              onSubmitted: (value) {
                if (value.startsWith('http')) {
                  webController.loadRequest(Uri.parse(value));
                } else {
                  webController.loadRequest(Uri.parse('https://$value'));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
