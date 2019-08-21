import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_secomp/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CadastroWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Crie uma conta",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColorStart: SecompColors.gradientStart,
        backgroundColorEnd: SecompColors.gradientEnd,
      ),
      body: WebView(
        initialUrl: "https://google.com.br/",
      ),
    );
  }
}
