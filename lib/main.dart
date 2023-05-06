import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:khelo/Header.dart';
import 'package:khelo/constatnts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kheloo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [
    "assets/Banner.jpg",
    "assets/Banner33.jpg",
    "assets/Banner44.jpg",
    "assets/Banner55.jpg",
  ];
  int _current = 0;
  int _selectedIndex = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      videoPlayerOptions: VideoPlayerOptions()
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Clrs.blackColor,
        // appBar: AppBar(
        //   title: header(),
        //   backgroundColor: Clrs.yellowColor,
        // ),
        body: SizedBox(
            // height: size.height,
            width: size.width,
            child: Column(
          children: [
           const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.4,
                      width: size.width,
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: items
                                .map((e) => Image.asset(
                                      e.toString(),
                                      height: size.height * 0.35,
                                      width: size.width,
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              height: size.height * 0.35,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _getIndicators(),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      // color: Colors.purple,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Clrs.yellowColor),
                              bottom: BorderSide(color: Clrs.yellowColor))),
                      child: Container(
                        color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('English', style: textStyles.textstyle1),
                            Text('हिंदी', style: textStyles.textstyle1),
                            Text('తెలుగు', style: textStyles.textstyle1),
                            Text('ಕನ್ನಡ', style: textStyles.textstyle1),
                            Text('मराठी', style: textStyles.textstyle1),
                            Icon(
                              Icons.more_horiz,
                              color: Clrs.yellowColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width,
                      child: Image.asset(
                        'assets/jackpot2.jpg',
                        height: size.height * 0.3,
                        fit: BoxFit.fitWidth,
                        width: size.width,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width,
                      child: Center(
                        child: Text(
                          'Live withdrawal'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.yellowAccent, fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                     padding: EdgeInsets.only(left: size.width*0.3,right: size.width*0.3),
                     child:const  Divider(height: 20,
                        thickness: 5,
                        color: Colors.yellowAccent,),
                   ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        height: size.height*0.15,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                            border: Border.all(color: Colors.yellowAccent,width: 2),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                userContainer("Meher", 4, "17955"),
                                userContainer("Anushka", 5, "31920"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                userContainer("Ira", 5, "11970"),
                                userContainer("Vivaan", 12, "27930"),
                              ],
                            ),
                          ],
                        ) ,

                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: size.height*0.25,
                      color: Colors.orange,
                    child:  Center(
                        child:  VideoPlayer(_controller),

                      ),
                    ),
                    const SizedBox(height: 20,),
                     SizedBox(
                      height: size.height * 0.1,
                      width: size.width,
                      child: Center(
                        child: Text(
                          'Games'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.yellowAccent, fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                     padding: EdgeInsets.only(left: size.width*0.3,right: size.width*0.3),
                     child:const  Divider(height: 20,
                        thickness: 5,
                        color: Colors.yellowAccent,),
                   ),

                        SizedBox(
                      height: size.height * 0.7,
                      width: size.width,
                      child: Image.asset(
                        'assets/games.jpg',
                        height: size.height * 0.7,
                        fit: BoxFit.fitWidth,
                        width: size.width,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.volume_up),
                  label: 'Support',
                  backgroundColor: Clrs.yellowColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_basketball),
                  label: 'Sports',
                  backgroundColor: Colors.green),
              BottomNavigationBarItem(
                icon: Icon(Icons.casino_outlined),
                label: 'Live Casino',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Register',
                backgroundColor: Colors.red,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation:
                5), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  // Widget header() {
  //   Size size = MediaQuery.of(context).size;
  //   return SizedBox(
  //     height: size.height * 0.1,
  //     width: size.width,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           height: size.height * 0.1,
  //           width: size.width * 0.8,
  //           color: Clrs.blackColor,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Image.asset(
  //                 'assets/kheloo-logo.png',
  //                 height: size.height * 0.08,
  //                 width: size.width * 0.4,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 10.0),
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/promotions.jpg',
  //                       height: size.height * 0.06,
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     const Text(
  //                       "Promotions",
  //                       style: TextStyle(color: Clrs.yellowColor, fontSize: 8,),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           height: size.height * 0.1,
  //           width: size.width * 0.2,
  //           color: Colors.yellow,
  //           child: Center(
  //             child: Text(
  //               "Login".toUpperCase(),
  //               style: const TextStyle(color: Clrs.whiteColor, fontSize: 12),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  List<Widget> _getIndicators() {
    return List.generate(
      items.length,
      (index) => Container(
        width: 50.0,
        height: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _current == index ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget userContainer(String title,int status,String amount){
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
              border: Border.all(color: Colors.orange,width: 2)
            ),
              child: const Icon(Icons.person,size: 35,color: Colors.white,)),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                RichText(
                  text:  TextSpan(children: [
                    TextSpan(
                        text: title,
                        style: GoogleFonts.gideonRoman(textStyle: const TextStyle(color: Clrs.whiteColor, fontSize: 18))),
                    const TextSpan(
                        text: '  '),
                    const TextSpan(
                        text: '₹',
                        style: TextStyle(fontSize: 18,color: Colors.orange)),
                     TextSpan(
                        text: amount,
                         style: GoogleFonts.gideonRoman(textStyle: const TextStyle(color: Clrs.whiteColor, fontSize: 18))),// this is invisible
                  ]),
                ),

                Text('${status.toString()} seconds ago',style: const TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          )
        ],
      ),

    );
  }
}

