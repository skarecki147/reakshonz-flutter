import 'package:flutter/material.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
          child: Column(
            children: [
              SizedBox(
                  width: 330.0,
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Your details',
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
                        // controller: 'password',
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
                      SizedBox(
                        width: 330.0,
                        height: 60.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: FloatingActionButton.extended(
                            label: const Text('UPDATE',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w900, letterSpacing: 3
                                )),
                            backgroundColor: const Color.fromRGBO(112, 44, 130, 1),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
