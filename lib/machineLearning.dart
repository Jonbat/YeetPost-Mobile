import 'package:flutter/material.dart';
import 'decodejson.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class MachineLearning extends StatefulWidget {
  static const platform = const MethodChannel('yeetpostML');

  @override
  _MachineLearningState createState() => _MachineLearningState();
}

class _MachineLearningState extends State<MachineLearning> {

  TextEditingController texts = new TextEditingController();
  List<int> inp = List();
  bool offensive = false;
  Color offensiveColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    Tokenize ondevice = Tokenize(1000, 'assets/devive_json.json');
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Machine Learning'),
            elevation: 0.0, // no shadow
            backgroundColor: Color(0xFF21BFBD),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (text) {
                  if(text=="") {
                    offensiveColor = Colors.black;
                    setState(() { 
                    });
                  }
                },
                style: TextStyle(color: offensiveColor,fontSize:18),
                maxLines: 8,
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: texts,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20, right: 40),
              child: RaisedButton(
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Analyze Text', style: TextStyle(fontSize: 24.0)),
                    ],
                  ),
                ),
                onPressed: () {
                  ondevice.getTokenized(texts.text).then((value) {
                    inp = value;
                    print(inp);
                  }).then((_) {
                    _getPredictData().then((data) {
                      setState(() {});
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // method that communicate with java code through platform specific channel

  Future<void> _getPredictData() async {
    try {
      final String result =
          await MachineLearning.platform.invokeMethod('predictData', {"arg": inp});
      if (result == "1") {
        offensiveColor = Colors.red;
      } else
        offensiveColor = Colors.green;
    
    } on PlatformException catch (e) {
     
      print(e.message);
    }
  }
}
