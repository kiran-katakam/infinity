import 'package:flutter/material.dart';
import 'package:infinity/inputpage.dart';
import 'package:infinity/webviewpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late SharedPreferences data;
  bool? isLoggedIn;
  
  Future<void> getData() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = data.containsKey("username");
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    if (isLoggedIn == null) {
      return MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: isLoggedIn! ? Login() : Input()
    );
  }
}
