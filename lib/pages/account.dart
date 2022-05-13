import 'package:flutter/material.dart';
import 'package:reakshonz_flutter/pages/auth_login.dart';

class AccountPage extends StatefulWidget {
  Map<TextEditingController, String> value;

  AccountPage(this.value, {Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<AccountPage> createState() => _AccountPageState(value);
}

class _AccountPageState extends State<AccountPage> {
  Map<TextEditingController, String> value = {};

  String username = '';
  String userEmail = '';

  _AccountPageState(Map<TextEditingController, String> value);
  @override
  void initState() {
    super.initState();
    print(value.length);
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
                    onPressed: () {},
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
