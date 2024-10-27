import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    bool available = await _speechToText.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );
    setState(() {
      _speechEnabled = available;
    });
    if (!_speechEnabled) {
      print('Speech recognition is not available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Text(
          _speechEnabled
              ? 'Speech Recognition Available'
              : 'Speech Recognition Unavailable',
        ),
      ),
    );
  }
}
