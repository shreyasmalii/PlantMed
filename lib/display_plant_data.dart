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
import 'package:plantmed/more_info.dart';

class Plant {
  final String className;
  final String scientificName;
  final List<String> location;
  final String information;
  final String imageName;
  final String procedure;

  Plant({
    required this.className,
    required this.scientificName,
    required this.location,
    required this.information,
    required this.imageName,
    required this.procedure,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      className: json['ClassName'],
      scientificName: json['ScientificName'],
      location: List<String>.from(json['Location']),
      information: json['Information'],
      imageName: json['imageName'],
      procedure: json['Procedure'],
    );
  }
}

Future<Plant> parseJson(String fileName) async {
  String jsonString = await rootBundle.loadString('$fileName');
  final jsonData = convert.jsonDecode(jsonString);
  return Plant.fromJson(jsonData);
}

class PlantInfoWidget extends StatefulWidget {
  final String fileName;

  PlantInfoWidget({required this.fileName});

  @override
  State<PlantInfoWidget> createState() => _PlantInfoWidgetState();
}

class _PlantInfoWidgetState extends State<PlantInfoWidget> {
  bool moreInfo = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Plant>(
            future: parseJson(widget.fileName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.hasData) {
                final plant = snapshot.data!;
                
                return Column(
                  children: [
                    Center(
                      child: Card(
                        elevation: 4,
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height:MediaQuery.of(context).size.height/1.4,

                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              !moreInfo ? Container(
                                height: MediaQuery.of(context).size.height/1.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 90,
                                      backgroundColor: Colors.grey,
                                      child: CircleAvatar(
                                        radius: 84,
                                        backgroundImage: AssetImage('assets/plant_images/${plant.imageName}'),
                                      ),
                                    ),

                                    SizedBox(height: 20),

                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.black87),
                                            children: <TextSpan>[
                                              TextSpan(text: 'Plant Name: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: plant.className),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(height: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.black87),
                                            children: <TextSpan>[
                                              TextSpan(text: 'Scientific Name: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: plant.scientificName),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(height: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.black87),
                                            children: <TextSpan>[
                                              TextSpan(text: 'Location: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: plant.location.toString()),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(height: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.black87),
                                            children: <TextSpan>[
                                              TextSpan(text: 'Medicinal Uses: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: plant.information),
                                            ],
                                          ),
                                        ),
                                  ],
                                ),
                              ) : Container(
                                height:MediaQuery.of(context).size.height/1.8,

                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.black87),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Procedure:\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: plant.procedure),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(onPressed: ()=>{
                                      setState(() {
                                        TextToSpeechState.flutterTts.stop();
                                        moreInfo = !moreInfo;
                                      }),
                                    },
                                      child: moreInfo ? Text("Back",) : Text("Show Procedure",),
                                    ),
                                    moreInfo ? TextToSpeech(text: plant.procedure) : TextToSpeech(text: plant.information),
                                  ],
                                ),
                              ),
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

class RenderPlantData extends StatefulWidget {
  String ?object_name;
  RenderPlantData(this.object_name);

  @override
  State<RenderPlantData> createState() => _RenderPlantDataState();
}

class _RenderPlantDataState extends State<RenderPlantData> {
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        // print("Popped .....");
        setState(() {
          TextToSpeechState.flutterTts.stop();
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
    // print(await flutterTts.getVoices);
    await flutterTts.setLanguage("eng-x-lvariant-f00");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    // await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    flutterTts.speak(text);
  }
  void pause() async {
    // print("Pausing ...");
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
