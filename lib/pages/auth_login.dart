import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:reakshonz_flutter/main.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  Map<TextEditingController, String> responseData = {};
  late Ink responseError;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _errorText() {
    final text = email.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  Future<void> callToSignIn() async {
    var body = {
      "email": email.text,
      "password": password.text,
      "returnSecureToken": true
    };

    return post(
            Uri.parse(
                'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyCrENy_PtnsvYixdXWJOJdic5kqvH4PtGU'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: json.encode(body))
        .then((response) {
      if (mounted) {
        setState(() {});
      }
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        responseData = map.cast<TextEditingController, String>();
      });
    }, onError: (error) {
      responseError = error;
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 330.0,
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Log in to your account',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 44, 130, 1),
                                fontSize: 24.0))),
                    const SizedBox(height: 60.0),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email address",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 44, 130, 1),
                              fontSize: 18.0),
                        )),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your user name.';
                        } else if (value.contains('@')) {
                          return 'Please don\'t use the @ char.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        // errorText: _errorText(),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 10.0),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 44, 130, 1),
                              fontSize: 18.0)),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: 330.0,
                      height: 60.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: FloatingActionButton.extended(
                          heroTag: 'login',
                          label: const Text('LOG IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3)),
                          backgroundColor:
                              const Color.fromRGBO(112, 44, 130, 1),
                          onPressed: () async {
                            await callToSignIn();
                            if (responseData.length == 1) {
                              return;
                            } else {
                              print('navigate to StartPage');
                              print(responseData.length);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      StartPage(responseData)));
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not got a DM Apps account?',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(112, 44, 130, 1))),
                        InkWell(
                            child: const Text('Register now',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(112, 44, 130, 1))),
                            onTap: () => {}),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
