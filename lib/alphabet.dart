import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:text_to_speech/text_to_speech.dart';


class Alphabets extends StatelessWidget {
  const Alphabets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: alphabet.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => ItemTile(index)
    );
  }
}

List<String> alphabet = [
  'A', 'B', 'C', 'D',
  'E', 'F', 'G', 'H',
  'I', 'J', 'K', 'L',
  'M', 'N', 'O', 'P',
  'Q', 'R', 'S', 'T',
  'U', 'V', 'W', 'X',
  'Y', 'Z', '0', '1',
  '2', '3', '4', '5',
  '6', '7', '8', '9'
];

TextToSpeech tts = TextToSpeech();

class ItemTile extends StatelessWidget {
  final int itemNo;
  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListTile(
        tileColor: color.withOpacity(0.3),
        onTap: () {
          tts.speak(alphabet[itemNo].toLowerCase());
        },
        title: Center(
          child: Stack(
            children: <Widget>[
              Text(
                alphabet[itemNo],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = color,
                ),
                textScaleFactor: 3,
                key: Key('text_$itemNo'),
              ),
              Text(
                alphabet[itemNo],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: color.withOpacity(0.5),
                ),
                textScaleFactor: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}