import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        child: Text('Register for an account',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 44, 130, 1), fontSize: 24.0))),
                    const SizedBox(height: 60.0),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Display name",
                          style: TextStyle(color: Color.fromRGBO(112, 44, 130, 1), fontSize: 18.0),
                        )),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      // controller: 'email',
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
                    const SizedBox(height: 10.0),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email address",
                          style: TextStyle(color: Color.fromRGBO(112, 44, 130, 1), fontSize: 18.0),
                        )),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      // controller: 'email',
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                          style:
                          TextStyle(color: Color.fromRGBO(112, 44, 130, 1), fontSize: 18.0)),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      // controller: 'password',
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                          label: const Text('CONTINUE',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w900, letterSpacing: 3
                              )),
                          backgroundColor: const Color.fromRGBO(112, 44, 130, 1),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already signed up?', style: TextStyle(fontSize: 17, color: Color.fromRGBO(112, 44, 130, 1))),
                        InkWell(
                            child: new Text('Log in now', style: const TextStyle(fontSize: 17, color: Color.fromRGBO(112, 44, 130, 1))),
                            onTap: () => {}
                        ),
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
