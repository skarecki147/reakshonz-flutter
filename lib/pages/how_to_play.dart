import 'package:flutter/material.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({Key? key}) : super(key: key);

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
              Text(
                'ReakShonz',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                  'ReakShonz is a simple yet addictive game that tests your reactions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              SizedBox(
                height: 30,
              ),
              Text(
                  'Targets light up one at a time and you need to tap them as quickly as possible.  The closer you are to the centre of a target and the quicker you respond, the more points you will receive. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              SizedBox(
                height: 30,
              ),
              Text(
                  "A maximum of 50,000 points is available for accuaracy and another 50,000 for speed; that's a whopping 100,000 points on offer per target!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              SizedBox(
                height: 30,
              ),
              Text(
                  'Each of the 9 targets will light up in a random order and then a final 10th target will light up.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              SizedBox(
                height: 30,
              ),
              Text('How close to 1,000,000 points can you get?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0))
            ]),
          )),
    );
  }
}
