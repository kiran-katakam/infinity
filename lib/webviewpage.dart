import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late WebViewController controller;
  late SharedPreferences data;
  late List<String> usernames;
  late String password;

  Future<void> getData() async {
    data = await SharedPreferences.getInstance();
    usernames = loadUsernameList(data.getString("username")!);
    password = data.getString("password")!;
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }

  List<String> loadUsernameList(String usernameList) {
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
    final List<String> finalList = [usernameList];
    var id = finalList.elementAt(0);

    for (int k = 0; k <= finalList.length; k++) {
      if (k < finalList.length) {
        id = finalList.elementAt(k);
      }
      for (int i = 0; i < id.length; i++) {
        var charid = id.split("");
        if (isNumeric(charid[i])) {
          charid[i] = superscripts[int.parse(charid[i])];
          if (!finalList.contains(join(charid))) {
            finalList.add(join(charid));
          }
        }
      }
    }
    return finalList;
  }

  String join(List<String> list) {
    String str = "";
    for (int i = 0; i < list.length; i++) {
      str += list[i];
    }
    return str;
  }

  @override
  void initState() {
    super.initState();
    getData();
    int i = 1;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            final String jsCode =
                "document.getElementById('ft_un').value = '${usernames[i]}';document.getElementById('ft_pd').value = '$password';document.forms[0].submit();";
            controller.runJavaScript(jsCode);
            if ((i + 1) > 63) {
              i = 1;
            } else {
              i++;
            }
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: WebViewWidget(controller: controller),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            controller.reload();
          });
        },
        backgroundColor: Color.fromRGBO(101, 0, 16, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        splashColor: Color.fromRGBO(255, 255, 255, 0.2),
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
