import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(112, 44, 130, 1),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Center(
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Text(
                'ReakShonz',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                  'This app is purely a proof of concept from Digital Marmalade.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              const SizedBox(
                height: 30,
              ),
              const Text('version: 1.4.3 - local',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ]),
          )),
    );
  }
}
