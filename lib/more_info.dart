// import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
// import 'package:flutter/services.dart' show rootBundle;
//
// class Plant {
//   final String className;
//   final String scientificName;
//   final List<String> location;
//   final String information;
//
//   Plant({
//     required this.className,
//     required this.scientificName,
//     required this.location,
//     required this.information,
//   });
//
//   factory Plant.fromJson(Map<String, dynamic> json) {
//     return Plant(
//       className: json['ClassName'],
//       scientificName: json['ScientificName'],
//       location: List<String>.from(json['Location']),
//       information: json['Information'],
//     );
//   }
// }
//
// Future<Plant> parseJson(String fileName) async {
//   String jsonString = await rootBundle.loadString('$fileName');
//   final jsonData = convert.jsonDecode(jsonString);
//   return Plant.fromJson(jsonData);
// }
//
// class PlantInfoWidget extends StatelessWidget {
//   final String fileName;
//
//   PlantInfoWidget({required this.fileName});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Plant>(
//       future: parseJson(fileName),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final plant = snapshot.data!;
//           return Center(
//             child: Card(
//               elevation: 4,
//               margin: EdgeInsets.all(16),
//               child: Container(
//                 width: 500,
//                 height: 400,
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Class Name: ${plant.className}',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Scientific Name: ${plant.scientificName}',
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Location: ${plant.location.join(", ")}',
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Information: ${plant.information}',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Plant Information Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Plant Information Demo'),
//         ),
//         body: PlantInfoWidget(fileName: 'assets/Aloevera.json'), // Provide the file name here
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
// import 'package:flutter/services.dart' show rootBundle;
//
// class Plant {
//   final String className;
//   final String scientificName;
//   final List<String> location;
//   final String information;
//
//   Plant({
//     required this.className,
//     required this.scientificName,
//     required this.location,
//     required this.information,
//   });
//
//   factory Plant.fromJson(Map<String, dynamic> json) {
//     return Plant(
//       className: json['ClassName'],
//       scientificName: json['ScientificName'],
//       location: List<String>.from(json['Location']),
//       information: json['Information'],
//     );
//   }
// }
//
// Future<Plant> parseJson(String fileName) async {
//   String jsonString = await rootBundle.loadString('$fileName');
//   final jsonData = convert.jsonDecode(jsonString);
//   return Plant.fromJson(jsonData);
// }
//
// class PlantInfoWidget extends StatelessWidget {
//   final String fileName;
//
//   PlantInfoWidget({required this.fileName});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Plant>(
//       future: parseJson(fileName),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else if (snapshot.hasData) {
//           final plant = snapshot.data!;
//           return Column(
//             children: [
//               // Image displayed at the start
//               Center(
//                 child: Container(
//                   height: 200,
//                   width: 300,
//                   child: Image.asset(
//                     'assets/aloevera.jpg', // Assuming the image file name matches the class name
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Plant information displayed in a Card widget
//               Card(
//                 elevation: 4,
//                 margin: EdgeInsets.all(16),
//                 child: Container(
//                   width: 300,
//                   height: 400,
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Class Name: ${plant.className}',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Scientific Name: ${plant.scientificName}',
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Location: ${plant.location.join(", ")}',
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Information: ${plant.information}',
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//         return SizedBox(); // Return an empty SizedBox if none of the above conditions are met
//       },
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Plant Information Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Plant Information Demo'),
//         ),
//         body: PlantInfoWidget(fileName: 'assets/Aloevera.json'), // Provide the file name here
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_tts/flutter_tts.dart';

// var tts;

class Plant {
  final String className;
  final String scientificName;
  final List<String> location;
  final String information;
  final String imageName;

  Plant({
    required this.className,
    required this.scientificName,
    required this.location,
    required this.information,
    required this.imageName,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      className: json['ClassName'],
      scientificName: json['ScientificName'],
      location: List<String>.from(json['Location']),
      information: json['Information'],
      imageName: json['imageName'],
    );
  }
}

Future<Plant> parseJson(String fileName) async {
  String jsonString = await rootBundle.loadString('$fileName');
  final jsonData = convert.jsonDecode(jsonString);
  return Plant.fromJson(jsonData);
}

class PlantInfoWidget extends StatelessWidget {
  final String fileName;
  PlantInfoWidget({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Plant>(
      future: parseJson(fileName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          final plant = snapshot.data!;
          // tts = TextToSpeech(text: plant.information);
          return Column(
            children: [
              // Plant information displayed in a Card widget
              Center(
                child: Card(
                  elevation: 4,
                  // margin: EdgeInsets.all(16),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    height:MediaQuery.of(context).size.height/1.6,

                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Image displayed inside a CircleAvatar
                        // Inside the PlantInfoWidget build method, replace the CircleAvatar widget with the following code:
                        CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: 84,
                            backgroundImage: AssetImage('assets/plant_images/${plant.imageName}'),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: <TextSpan>[
                              TextSpan(text: 'Procedure: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: plant.information),
                            ],
                          ),
                        ),
                        TextToSpeech(text: plant.information),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox(); // Return an empty SizedBox if none of the above conditions are met
      },
    );
  }
}

class MoreInfo extends StatefulWidget {
  String ?object_name;
  MoreInfo(this.object_name);

  @override
  State<MoreInfo> createState() => _MoreInfo();
}

class _MoreInfo extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        print("Popped .....");
        setState(() {
          TextToSpeechState.flutterTts.stop();
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Plant Information Demo',
        home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromRGBO(0, 100, 0, 1.0),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom:
                Radius.circular(30), // Adjust the radius value for the curve
              ),
            ),
            title: const Text(
              "PlantMed",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlantInfoWidget(fileName: 'assets/json_files/${widget.object_name}.json'),
            ],
          ), // Provide the file name here
        ),
      ),
    );
  }
}

class TextToSpeech extends StatefulWidget {
  var text;
  TextToSpeech({Key? key, this.text}):super(key:key);

  @override
  State<TextToSpeech> createState() => TextToSpeechState();
}

class TextToSpeechState extends State<TextToSpeech> {
  static FlutterTts flutterTts = FlutterTts();
  bool stop_voice = true;

  void speak(String text) async {
    print(await flutterTts.getVoices);
    await flutterTts.setLanguage("eng-x-lvariant-f00");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    // await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    flutterTts.speak(text);
  }
  void pause() async {
    print("Pausing ...");
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: ()=>{
      setState(() {
        stop_voice = !stop_voice;
      }),
      if(stop_voice){
        pause(),
      }
      else{
        speak(widget.text),
      }
    },
        icon: stop_voice==true ? Icon(Icons.volume_up_sharp) : Icon(Icons.volume_off_sharp)
    );
  }
}
