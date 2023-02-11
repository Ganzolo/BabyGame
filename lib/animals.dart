import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';


class Animals extends StatelessWidget {
  Animals({Key? key}) : super(key: key);

  String _mainQuestion = "Matteo. Where is the cow?";

  void readText() {
    TextToSpeech tts = TextToSpeech();
    tts.setPitch(0.8);
    tts.speak(_mainQuestion);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child:Center(
              child: Text(
                "Matteo, Where is the cow?",
                style: TextStyle(
                  fontFamily: "Arial",
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
            ),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blueAccent, Colors.blueGrey]),
            ),
          ),
          Expanded (
          child: GridView.builder(
              itemCount: animals.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
              ), itemBuilder: (context, index) => AnimalItem(index)
          ),
          ),
        ]
      )
    );
  }
}

List animals = [
  "Assets/bird.jpg",
  "Assets/cat.jpg",
  "Assets/cow.jpg",
  "Assets/dog.jpg",
  "Assets/duck.jpg",
  "Assets/horse.jpg",
  "Assets/rabbit.jpg",
  "Assets/sheep.jpg",
  "Assets/zebra.jpg",
];

class AnimalItem extends StatelessWidget {
  final int animalNo;
  const AnimalItem(this.animalNo, {super.key});

    @override
    Widget build(BuildContext context) {
      return Image.asset(animals[animalNo], fit: BoxFit.cover);
    }
}