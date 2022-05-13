import 'package:flutter/material.dart';
import 'package:reakshonz_flutter/pages/account.dart';
import 'package:reakshonz_flutter/pages/auth_login.dart';
import 'package:reakshonz_flutter/pages/home_container.dart';
import 'package:reakshonz_flutter/pages/play.dart';

import 'pages/how_to_play.dart';

void main() {
  runApp(MaterialApp(home: StartPage({})));
}

class StartPage extends StatefulWidget {
  Map<TextEditingController, String> value;
  StartPage(this.value, {Key? key}) : super(key: key);
  @override
  State<StartPage> createState() => _StartPageState(value);
}

class _StartPageState extends State<StartPage> {
  Map<TextEditingController, String> anotherValue = {};
  int activeIndex = 0;
  List<Widget> pages = [];

  _StartPageState(this.anotherValue);
  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  void initState() {
    // print(anotherValue.length);
    if (anotherValue.length == 1 || anotherValue.isEmpty) {
      setState(() {
        activeIndex = 3;
      });
    } else {
      setState(() {
        activeIndex = 0;
      });
    }
    super.initState();

    pages = [
      const HomeContainer(),
      Play(),
      AccountPage(anotherValue),
      const AuthLoginPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: activeIndex < 3
            ? SizedBox(
                height: 70.0,
                child: BottomAppBar(
                  color: Colors.purple[800],
                  child: IconTheme(
                    data: IconThemeData(
                        color: Theme.of(context).colorScheme.onPrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox.fromSize(
                          size: const Size(80, 80),
                          child: Material(
                            color: Colors.purple[800],
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: const Icon(Icons.home, size: 30.0),
                                      onPressed: () => changeActivePage(0)),
                                  const Text("Home",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(80, 80),
                          child: Material(
                            color: Colors.purple[800],
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: const Icon(
                                          Icons.play_arrow_outlined,
                                          size: 30.0),
                                      onPressed: () => changeActivePage(1)),
                                  const Text("Play",
                                      style: TextStyle(
                                          color: Colors.white)), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(80, 80),
                          child: Material(
                            color: Colors.purple[800],
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: const Icon(Icons.account_circle,
                                          size: 30.0),
                                      onPressed: () => {
                                            changeActivePage(2),
                                          }),
                                  const Text("Account",
                                      style: TextStyle(
                                          color: Colors.white)), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : null,
        body: pages[activeIndex]);
  }
}
