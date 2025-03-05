import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantmed/display_plant_data.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';
import 'dashboard_model.dart';
import 'gallery.dart';
export 'dashboard_model.dart';
import 'real_time.dart';

class DashboardWidget extends StatefulWidget {

  const DashboardWidget({Key? key}) : super(key: key);
  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;
  late File _imageFile;
  var object_name;
  List list = [
    "Aloevera",
    "Amruthaballi",
    "Arali",
    "Arive-Dantu",
    "Artocarpus Heterophyllus -Jackfruit-",
    "ashoka",
    "Azadirachta Indica -Neem-",
    "Basella Alba -Basale-",
    "Beans",
    "Betel",
    "Bhrami",
    "Carissa Carandas -Karanda-",
    "Castor",
    "Chakte",
    "Citron lime -herelikai-",
    "Citrus Limon -Lemon-",
    "Coriender",
    "Country-Mallow",
    "Crown flower",
    "Ekka",
    "Eucalyptus",
    "Fenugreek",
    "Ficus Religiosa -Peepal Tree-",
    "Ficus Auriculata -Roxburgh fig-",
    "Hibiscus",
    "Indian Sarsaparilla",
    "Indian pennywort",
    "Indian-Thornapple",
    "Insulin",
    "Ivy Gourd",
    "Jasminum -Jasmine-",
    "Kambajala",
    "Mangifera Indica -Mango-",
    "Mentha -Mint-",
    "Moringa Oleifera -Drumstick-",
    "Muntingia Calabura -Jamaica Cherry-Gasagase-",
    "Murraya Koenigii -Curry-",
    "Nerium Oleander -Oleander-",
    "Pongamia Pinnata -Indian Beech-",
    "Psidium Guajava -Guava-",
    "Santalum Album -Sandalwood-",
    "Tamarind",
    "Tulsi",
    "Turmeric",
  ];
//Camera code
  Future<int> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) {
      return -1;
    } ; // User canceled the operation

    setState(() {
      _imageFile = File(pickedImage.path);
    });
    return 0;
    // Read the image file as bytes
    // final Uint8List? bytes = await _imageFile.readAsBytes();
    // if (bytes == null) return;

    // Save the image to the gallery
    // final result = await ImageGallerySaver.saveImage(bytes);
    // if (result['isSuccess']) {
    //   print('Image saved to gallery successfully');
    // } else {
    //   print('Failed to save image to gallery');
    // }
  }


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _imageFile = File('') ;
    _model = createModel(context, () => DashboardModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: LoaderOverlay(
        closeOnBackButton: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
          bottomNavigationBar: menu(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                          // decoration : BoxDecoration(color: Colors.green),
                          // height : 500,
                          width :  MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GFSearchBar(
                                  searchList: list,
                                  searchQueryBuilder: (query, list) => list
                                      .where((item) {
                                    return item!.toString().toLowerCase().contains(query.toLowerCase());
                                  }).toList(),
                                  overlaySearchListItemBuilder: (dynamic item) => Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  onItemSelected: (dynamic item) {
                                    setState(() {
                                      print('$item');
                                      if(item != null){
                                        Navigator.push(context, MaterialPageRoute(builder: (Context)=>RenderPlantData(item)));
                                      }
                                    });
                                  },
                              ),
                              CarouselSlider(
                                items: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Sliding img1.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/sliding2.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/sliding3.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/sliding4.webp',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                                carouselController:
                                _model.carouselController ??=
                                    CarouselController(),
                                options: CarouselOptions(
                                  initialPage: 1,
                                  viewportFraction: 0.5,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                                ),
                              ),
                              Container(
                                height : MediaQuery.of(context).size.height/4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround ,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 100,
                                            child: GestureDetector(
                                              onTap: () async {
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => gallery()));
                                              },
                                              child: Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Icon(Icons.image_search_sharp,
                                                        color: Colors.white70,
                                                        size: 60,
                                                      ),
                                                      Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 18, fontFamily: 'Montserrat'),)
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(0, 100, 0, 1.0),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            height: 100,
                                            child: GestureDetector(
                                              onTap: () async {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RealTime()));
                                              },
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Icon(Icons.camera_sharp,
                                                        color: Colors.white70,
                                                        size: 60,
                                                      ),
                                                      Text("Camera",style: TextStyle(color: Colors.white,fontSize: 18, fontFamily: 'Montserrat'),)
                                                    ],
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(0, 100, 0, 1.0),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                 margin : EdgeInsets.fromLTRB(0, 0, 0, 20),
                                 child: Expanded(child: Text("Note: Use Camera Scanning for Better Results",style: TextStyle(fontSize: 16),))
                              )
                            ],
                          ),
                      ),
                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height : MediaQuery.of(context).size.height/3,
                                child: SvgPicture.asset(
                                  'assets/images/about-us.svg',
                                  width: 300,
                                  height: 215,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height : MediaQuery.of(context).size.height/3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('About us ',
                                      style: FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Montserrat',
                                        color: Color.fromRGBO(0, 100, 0, 1.0),
                                        fontSize: 28,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    Text('Medicinal Plant Detection',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Container(
                                      width : MediaQuery.of(context).size.width/1.2,
                                      height: MediaQuery.of(context).size.height/6,
                                      child: Text('This app uses image processing techniques to identify Medicinal Herbs from images captured by the camera or uploaded image from gallery.Join us on a journey to unlock nature\'s healing power. Explore, discover, and harness the magic of medicinal plants with us today!',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.black45,
                                          fontSize: 14,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // decoration: BoxDecoration(color: Colors.green),
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Color.fromARGB(153, 194, 255, 154),
      child: const TabBar(
        labelColor: Color.fromRGBO(0, 100, 0, 1.0),
        unselectedLabelColor: Color.fromARGB(249, 90, 90, 90),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color.fromRGBO(0, 100, 0, 1.0),
        tabs: [
          Tab(
            text: "Scan",
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: "About Us",
            icon: Icon(Icons.question_mark_rounded),
          ),
        ],
      ),
    );
  }
}



/*

child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.13, -0.04),
                                child: RichText(
                                  textScaler: MediaQuery
                                      .of(context)
                                      .textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'About us ',
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Montserrat',
                                          color: Color.fromRGBO(0, 100, 0, 1.0),
                                          fontSize: 28,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' -Medicinal plant detection',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )

 */