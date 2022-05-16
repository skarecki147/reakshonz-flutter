// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:reakshonz_flutter/pages/account_details.dart';
import 'package:reakshonz_flutter/pages/auth_login.dart';

class AccountPage extends StatefulWidget {
  Map<dynamic, dynamic> value;
  AccountPage(this.value, {Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState(value);
}

class _AccountPageState extends State<AccountPage> {
  Map<dynamic, dynamic> anotherValue = {};
  _AccountPageState(this.anotherValue);

  String username = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      userEmail = anotherValue['email'];
    });
    setState(() {
      print(anotherValue);
      username = anotherValue['displayName'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
          child: Column(
            children: [
              SizedBox(
                  child: Column(
                children: [
                  Text(username,
                      style: const TextStyle(
                          color: Color.fromRGBO(112, 44, 130, 1),
                          fontSize: 32.0)),
                  Text(userEmail,
                      style: const TextStyle(
                          color: Color.fromRGBO(112, 44, 130, 1),
                          fontSize: 20.0)),
                  const SizedBox(height: 60.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size.fromHeight(65),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountDetailsPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Your details',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 44, 130, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '>',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 44, 130, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size.fromHeight(65),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AuthLoginPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Log out',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 44, 130, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '>',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 44, 130, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )
                        ],
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
