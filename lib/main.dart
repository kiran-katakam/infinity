import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

//! implement algo
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            final String jsCode = "document.getElementById('ft_un').value = '²³BCE9783';document.getElementById('ft_pd').value = 'ejxFw4tr';document.forms[0].submit();";
            controller.runJavaScript(jsCode);
          },
          onHttpError: (HttpResponseError error) {
            print("HTTP Error: ${error.response}");
          },
          onWebResourceError: (WebResourceError error) {
            print("Resource Error: ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('http://172.18.10.10:1000/logout?'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
 
//! TODO 
/*void main() {
  List<String> usernameList = [];
  usernameList.add("23BCE9783");
  changeUsernameList(usernameList);
  print(usernameList);
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

void changeUsernameList(List<String> usernameList) {
  final List<String> superscripts = [
    "⁰",
    "¹",
    "²",
    "³",
    "⁴",
    "⁵",
    "⁶",
    "⁷",
    "⁸",
    "⁹"
  ];
  var id = usernameList.elementAt(0);

  for (int k = 0; k <= usernameList.length; k++) {
    if (k < usernameList.length) {
      id = usernameList.elementAt(k);
    }
    for (int i = 0; i < id.length; i++) {
      var charid = id.split("");
      if (isNumeric(charid[i])) {
        charid[i] = superscripts[int.parse(charid[i])];
        print(charid);
        if (!usernameList.contains(toString(charid))) {
          usernameList.add(toString(charid));
        }
      }
      
    }
  }
}

String toString(List<String> list) {
  String str = "";
  for (int i = 0; i < list.length; i++) {
    str += list[i];
  }
  return str;
}
 */