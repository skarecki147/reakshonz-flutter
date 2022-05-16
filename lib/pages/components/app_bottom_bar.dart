import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.purple[800],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox.fromSize(
              size: const Size(70, 70),
              child: Material(
                color: Colors.purple[800],
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.home, size: 36.0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      const Text("Home", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(60, 60),
              child: Material(
                color: Colors.purple[800],
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon:
                              const Icon(Icons.play_arrow_outlined, size: 30.0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/play');
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(60, 60),
              child: Material(
                color: Colors.purple[800],
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.account_circle, size: 30.0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/account');
                          }),
                      // const Text("Account",
                      //     style: TextStyle(color: Colors.white)), // text
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
