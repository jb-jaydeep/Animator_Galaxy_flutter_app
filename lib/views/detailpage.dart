import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_6_flutter_app/Controllers/Provider.dart';
import 'package:pr_6_flutter_app/Models/AllModel.dart';
import 'package:provider/provider.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 10000,
      ),
      lowerBound: 0,
      upperBound: pi * 2,
    );

    animationController.repeat();
  }

  @override
  // dispose() {
  //   animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    Planet data = ModalRoute.of(context)!.settings.arguments as Planet;
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: data.hero,
          child: Container(
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: h,
                          width: w,
                        ),
                        AnimatedBuilder(
                          animation: animationController,
                          child: Image.asset(data.image),
                          builder: (context, widget) => Transform.rotate(
                            angle: animationController.value,
                            child: widget,
                          ),
                        ),
                        Positioned(
                          top: 200,
                          child: Container(
                            height: h * 0.9,
                            width: w * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white54.withOpacity(0.4),
                                ),
                                BoxShadow(
                                  color: Color(0xff353467).withOpacity(0.7),
                                  spreadRadius: -5.0,
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.name,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: h * 0.055,
                                            letterSpacing: 1,
                                            color: (Provider.of<ThemeProvider>(
                                                        context)
                                                    .isdark)
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<Favorite_Provider>(
                                                  context,
                                                  listen: false)
                                              .addFavoriteValue(data);
                                        },
                                        icon: (Provider.of<Favorite_Provider>(
                                                    context)
                                                .f1
                                                .favorite)
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: h * 0.05,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                                size: h * 0.05,
                                              ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120),
                                    child: Divider(
                                      color: Colors.grey.withOpacity(0.5),
                                      thickness: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Description",
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: h * 0.030,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: h * 0.03,
                                          ),
                                          Text(
                                            "\t\t\t\t${data.description}",
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: h * 0.02,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: h * 0.035,
                                          ),
                                          Divider(
                                            color: Colors.grey.withOpacity(0.5),
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Details",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: h * 0.025,
                                                    letterSpacing: 1,
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Surface Area :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.surfaceArea}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Dist. from Sun :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.0215,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.distance}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.015,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Diameter :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.diameter}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Length Of Year :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.lengthOfYear}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Velocity :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.velocity}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Gravity :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.gravity}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Leanth Of Day :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.leanthOfDay}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Number Of Moons :",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  ${data.numberOfMoons}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: h * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Divider(
                                            color: Colors.grey.withOpacity(0.5),
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: h * 0.025,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Gallery",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: h * 0.025,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.015,
                                          ),
                                          Container(
                                            height: h * 0.4,
                                            width: w,
                                            child: GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 15,
                                                      mainAxisSpacing: 20),
                                              itemCount: data.images.length,
                                              itemBuilder: (context, i) =>
                                                  Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        data.images[i]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: h * 0.2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
    );
  }
}
