library flutter_multipagos;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_multipagos/multipagos_requets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class Multipagos extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final void Function()? actionSuccess;
  final void Function()? actionFail;
  final MultipagosRequest multipagos;
  final String bbvaEnv;
  final String title;
  const Multipagos({
    super.key,
    required this.multipagos,
    required this.bbvaEnv,
    required this.title,
    this.actionSuccess,
    this.actionFail,
    this.appBar,
  });

  @override
  _MultipagosState createState() => _MultipagosState();
}

class _MultipagosState extends State<Multipagos> {
  var htmlString = '';
  var cargando = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late MultipagosRequest request;

  @override
  void initState() {
    request = widget.multipagos;
    refresh();
    _peticion(request, widget.bbvaEnv);
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  widget.appBar,
      body: SafeArea(
        child: Column(
          children: [
            cargando
                ? Expanded(
                    child: WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {},
                            onPageStarted: (String url) {
                              // print(["onPageStarted", url]);
                            },
                            onPageFinished: (String url) {
                              // print(["onPageFinished", url]);
                            },
                            onWebResourceError: (WebResourceError error) {
                              print("onWebResourceError ${error}");
                            },
                            onNavigationRequest:
                                (NavigationRequest request) async {
                              if (request.url
                                  .startsWith(widget.multipagos.mpUrlsucces)) {
                                if (widget.actionSuccess != null) {
                                  widget.actionSuccess!();
                                }
                                return NavigationDecision.navigate;
                              }
                              if (request.url
                                  .startsWith(widget.multipagos.mpUrlFailure)) {
                                if (widget.actionFail != null) {
                                  widget.actionFail!();
                                }
                                return NavigationDecision.navigate;
                              }
                              return NavigationDecision.navigate;
                            },
                          ),
                        )
                        ..loadRequest(Uri.dataFromString(htmlString,
                            mimeType: 'text/html',
                            encoding: Encoding.getByName('utf-8'))),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<void> _peticion(MultipagosRequest request, url) async {
    Map<String, String> headers = {
      // "Content-Type": "application/x-www-form-urlencoded"
    };

    try {
      final res = await http.post(Uri.parse(url),
          body: request.toJson(), headers: headers);
      htmlString = res.body;
      cargando = true;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
