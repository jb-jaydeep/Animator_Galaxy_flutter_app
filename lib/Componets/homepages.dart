import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Controllers/Provider.dart';
import '../Models/AllModel.dart';

class homepages extends StatefulWidget {
  const homepages({super.key});

  @override
  State<homepages> createState() => _homepagesState();
}

class _homepagesState extends State<homepages>
    with SingleTickerProviderStateMixin {
  double begin = 0;
  double end = pi * 2;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // LoadJsonData();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 10,
      ),
      lowerBound: 0,
      upperBound: pi * 2,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString("assets/json/planets.json"),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decodedData = jsonDecode(data);
            List myData = decodedData["Data"];

            List<Planet> PostData =
                myData.map((e) => Planet.fromJson(Data: e)).toList();
            return Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                image: (Provider.of<ThemeProvider>(context).isdark)
                    ? DecorationImage(
                        image: AssetImage("assets/images/fp.gif"),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage("assets/images/bgWhite.jpg"),
                        fit: BoxFit.cover,
                      ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: h * 0.8,
                            width: w,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: PostData.length,
                              itemBuilder: (context, i) => Hero(
                                tag: PostData[i].hero,
                                flightShuttleBuilder:
                                    (context, _, __, ___, ____) {
                                  return Container(
                                    height: h,
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: Color(0xff01203f),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bgGalaxy.png"),
                                      ),
                                    ),
                                    child: Image.asset(
                                      PostData[i].image,
                                      height: h * 0.2,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: h * 0.5,
                                  width: w * 0.75,
                                  margin: EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.purple.withOpacity(0.4),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TweenAnimationBuilder(
                                              duration: Duration(seconds: 10),
                                              curve: Curves.easeInOut,
                                              tween: Tween<double>(
                                                  begin: begin, end: end),
                                              child: Container(
                                                height: h * 0.2,
                                                width: w,
                                                child: Image.asset(
                                                    PostData[i].image

                                                    // height: h * 0.3,
                                                    ),
                                              ),
                                              onEnd: () {},
                                              builder:
                                                  (context, degree, widget) =>
                                                      Transform.rotate(
                                                angle: degree,
                                                child: widget,
                                              ),
                                            ),
                                            Container(
                                              height: h * 0.1,
                                              width: w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white54
                                                        .withOpacity(0.4),
                                                  ),
                                                  BoxShadow(
                                                      color: Color(0xff6824a4),
                                                      spreadRadius: 0.0,
                                                      blurRadius: 20.0,
                                                      offset: Offset(6, 5)),
                                                ],
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Name : ${PostData[i].name}",
                                                style: GoogleFonts.almarai(
                                                  textStyle: TextStyle(
                                                    fontSize: h * 0.03,
                                                    color: (Provider.of<
                                                                    ThemeProvider>(
                                                                context)
                                                            .isdark)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                            Container(
                                              height: h * 0.1,
                                              width: w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white54
                                                        .withOpacity(0.4),
                                                  ),
                                                  BoxShadow(
                                                      color: Color(0xff6824a4),
                                                      spreadRadius: 0.0,
                                                      blurRadius: 20.0,
                                                      offset: Offset(6, 5)),
                                                ],
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Temperature :${PostData[i].temperature}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: (Provider.of<
                                                                    ThemeProvider>(
                                                                context)
                                                            .isdark)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: h * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                            Container(
                                              height: h * 0.1,
                                              width: w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white54
                                                        .withOpacity(0.4),
                                                  ),
                                                  BoxShadow(
                                                      color: Color(0xff6824a4),
                                                      spreadRadius: 0.0,
                                                      blurRadius: 20.0,
                                                      offset: Offset(6, 5)),
                                                ],
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Velocity : ${PostData[i].velocity}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: (Provider.of<
                                                                    ThemeProvider>(
                                                                context)
                                                            .isdark)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: h * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                    "DetailPage",
                                                    arguments: PostData[i]);
                                              },
                                              child: Container(
                                                height: h * 0.1,
                                                width: w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(35),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white54
                                                          .withOpacity(0.4),
                                                    ),
                                                    BoxShadow(
                                                        color:
                                                            Color(0xff6824a4),
                                                        spreadRadius: 0.0,
                                                        blurRadius: 20.0,
                                                        offset: Offset(6, 5)),
                                                  ],
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Tap for More Info",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: h * 0.025,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: (Provider.of<
                                                                      ThemeProvider>(
                                                                  context)
                                                              .isdark)
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            const Text("Error");
          }
          return const Center(
            child: Text("NO found"),
          );
        },
      ),
    );
  }
}
