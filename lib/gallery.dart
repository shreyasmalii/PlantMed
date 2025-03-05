import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantmed/display_plant_data.dart';
import 'package:plantmed/yolov8s_inference.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(gallery());
}

class gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _imagePath, object_name;

  Future<void> _pickImages() async {
    try {
      var pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _imagePath = pickedImage.path;
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Drag-and-drop container
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child:  Center(
                      child: Text('Selected Image'),
                    )
                  ),
                  // Selected image container
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child:_imagePath != null ? Image(image : FileImage(File(_imagePath))) : null,
                  ),
                ],
              ),
              ElevatedButton(onPressed: ()async=>{
                if(_imagePath != null){
                    context.loaderOverlay.show(),
                    object_name =await get_class_name(File(_imagePath)),
                    // print("Object name = ${object_name}"),
                    context.loaderOverlay.hide(),
                    if(object_name != "null"){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RenderPlantData(object_name),)),
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Detection Failed"),
                            content: Text("Make sure that you selected a valid Image."),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    }
                }
                else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Missing Image"),
                        content: Text("Please Select an Image from Gallery"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                }
              },
                child: Text("Confirm",style: TextStyle(color: Color.fromRGBO(0, 100, 0, 1.0))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(153, 194, 255, 154),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),

              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImages,
          child: Icon(Icons.image_outlined,color: Colors.white),
         backgroundColor: Color.fromRGBO(0, 100, 0, 1.0),
        ),
      ),
    );
  }
}
