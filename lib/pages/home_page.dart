import 'package:flutter/material.dart';
import 'package:reakshonz_flutter/pages/about.dart';
import 'package:reakshonz_flutter/pages/how_to_play.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Text('ReakShonz',
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 30.0),
            Text('ReakShonz',
                style: TextStyle(color: Colors.purple[800], fontSize: 18.0)),
            const SizedBox(height: 140.0),
            SizedBox(
              width: 200.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FloatingActionButton.extended(
                  heroTag: 'howToPlay',
                  label: Text('HOW TO PLAY',
                      style:
                          TextStyle(color: Colors.purple[800], fontSize: 14.0)),
                  backgroundColor: Colors.black87,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HowToPlayPage()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 200.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FloatingActionButton.extended(
                  heroTag: 'about',
                  label: Text('ABOUT',
                      style:
                          TextStyle(color: Colors.purple[800], fontSize: 14.0)),
                  backgroundColor: Colors.black87,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
