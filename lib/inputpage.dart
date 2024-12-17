import 'package:flutter/material.dart';
import 'package:infinity/webViewPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late SharedPreferences data;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  Future<void> getData() async {
    data = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    getData();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration textFieldDecoration(String label) {
    return InputDecoration(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: TextField(
                      controller: usernameController,
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.text,
                      decoration: textFieldDecoration("Username"),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: textFieldDecoration("Password"),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        data.setString("username", usernameController.text.trim());
                        data.setString("password", passwordController.text.trim());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: Size(20, 40)
                      ),
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
