import 'package:flutter/material.dart';
import 'package:test_flutter_webviewer/src/WebView/component/body.dart';

class WebViewScreen extends StatelessWidget {
  final Function? updateUrlMagellan;

  const WebViewScreen({
    Key? key,
    this.updateUrlMagellan,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(updateUrlMagellan: updateUrlMagellan),
    );
  }
}
