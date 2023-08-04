import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;

  late var link;

  var linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
        color: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: SizedBox(
          height: 50,
          child: TextField(
            onSubmitted: (value) {
              link = Uri.parse(value);
              if (link.scheme.isEmpty) {
                link = Uri.parse(value);
              }
              webViewController!.loadUrl(
                urlRequest: URLRequest(url: link),
              );
            },
            controller: linkController,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white,
            ),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hoverColor: Colors.white,
              border: UnderlineInputBorder(),
              hintText: "Search ",
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InAppWebView(
              onLoadStop: (controller, url) {
                refreshController!.endRefreshing();
              },
              onLoadStart: (controller, url) {
                var value = url.toString();
                setState(() {
                  linkController.text = value;
                });
              },
              pullToRefreshController: refreshController,
              onWebViewCreated: (controller) => webViewController = controller,
              initialUrlRequest: URLRequest(
                url: Uri.parse(data),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
