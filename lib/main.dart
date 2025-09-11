import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Color Generator',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget 
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Truth and Dare Game'),

        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TruthScreen()),
                );
              },
              child: Text('Truth'),
            ),
            SizedBox(height: 20), // Adds space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DareScreen()),
                );
              },
              child: Text('Dare'),
            ),
          ],
        ),
      ),
    );
  }
}

Color getRandomColor() {
  return Color.fromARGB(
    255,
    Random().nextInt(256), // Red
    Random().nextInt(250), // Green
    Random().nextInt(256), // Blue
  );
}

class TruthScreen extends StatefulWidget 
{
  @override
  _TruthScreenState createState() => _TruthScreenState();
}

class _TruthScreenState extends State<TruthScreen> {
  final List<String> truths = [
    "Have you ever talked to someone just for attention?",
    "Have you ever spoken ill of your friend to someone? What did you say?",
    "What decision do you regret the most?",
    "Which of your friends do you think is the most annoying?",
    "Have you ever pretended to like someone just to avoid drama?",
    "Have you ever lied about your feelings just to keep someone as a friend?",
    "Which friend do you secretly have feelings for but can’t confess to?",
  ];

  String displayedTruth = "";
  final random = Random();

  void showRandomTruth() {
    // Flicker effect for suspense
    for (int i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        setState(() {
          displayedTruth = truths[random.nextInt(truths.length)];
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showRandomTruth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getRandomColor(),
      appBar: AppBar(
        title: Text('Truth'),
        backgroundColor: Color.fromARGB(255, 83, 4, 97),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayedTruth,
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showRandomTruth, // Roll Again
              child: Text('Roll Again'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class DareScreen extends StatefulWidget {
  @override
  _DareScreenState createState() => _DareScreenState();
}

class _DareScreenState extends State<DareScreen> {
  final List<String> dares = [
    "Whisper 'I have a crush on you' in the ear of the person you find most attractive here.",
    "Read the last message you sent to your crush out loud.",
    "Ask someone for a secret you’ve always wanted to know.",
    "Whisper a fantasy to someone.",
    "Dance like nobody’s watching for 30 seconds.",
    "Let someone else style your hair in a crazy way.",
    "Whisper one thing you admire about someone in the room.",
    "Ask someone a flirty “what if” scenario",
    "Confess to your crush that you like them, and explain why you haven’t told them before.",
  ];

  String displayedDare = "";
  final random = Random();

  void showRandomDare() {
    // Flicker through 10 random dares quickly
    for (int i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        setState(() {
          displayedDare = dares[random.nextInt(dares.length)];
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showRandomDare();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getRandomColor(),
      appBar: AppBar(
        title: Text('Dare'),
        backgroundColor: Color.fromARGB(255, 83, 4, 97),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayedDare,
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showRandomDare, // Roll Again
              child: Text('Roll Again'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}












