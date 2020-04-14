import 'dart:typed_data';
import 'package:flutter/material.dart';
/*
import 'package:mlkit/mlkit.dart';

FirebaseModelInterpreter interpreter = FirebaseModelInterpreter.instance;
FirebaseModelManager manager = FirebaseModelManager.instance;
*/

// Register Cloud Model
Widget test() {
  /*
  manager.registerRemoteModelSource(FirebaseRemoteModelSource(modelName: "Cyberbully-Classifier"));

  var results = interpreter.run(
    remoteModelName: "Cyberbully-Classifier",
    inputOutputOptions: FirebaseModelInputOutputOptions([
      FirebaseModelIOOption(FirebaseModelDataType.BYTE, [1, 224, 224, 3])
    ], [
      FirebaseModelIOOption(FirebaseModelDataType.FLOAT32, [1, 1001])
    ]),
    inputBytes: stringToByteList("Hello"),
  );

  results.then((onValue) {
    print(onValue);
  });
  return Text(results.toString());
  */
  return Text("Machine learning test");
}

Uint8List stringToByteList(String input) {
  var list = new List<int>();
  input.runes.forEach((rune) {
    if (rune >= 0x10000) {
      rune -= 0x10000;
      int firstWord = (rune >> 10) + 0xD800;
      list.add(firstWord >> 8);
      list.add(firstWord & 0xFF);
      int secondWord = (rune & 0x3FF) + 0xDC00;
      list.add(secondWord >> 8);
      list.add(secondWord & 0xFF);
    }
    else {
    	list.add(rune >> 8);
    	list.add(rune & 0xFF);
    }
  });
  return Uint8List.fromList(list);
}

var inputText = ("Cyberbullying test text");



class MlTest extends StatefulWidget {
  @override
  _MlTestState createState() => _MlTestState();
}

class _MlTestState extends State<MlTest> {

  String testText = "Text to change";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ML Title"),
          elevation: 0.0, // no shadow
          backgroundColor: Color(0xFF21BFBD),
      ),
      backgroundColor: Colors.white,
      body: Column( 
        children: [ 
          Text("ML Test"),
          test()
        ]
      ) 

    );
  }
}