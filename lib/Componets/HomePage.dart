// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../Controllers/Provider.dart';
// import '../utills/Attributes.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   double begin = 0;
//   double end = pi * 2;
//   late AnimationController animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     LoadJsonData();
//     animationController = AnimationController(
//       vsync: this,
//       duration: Duration(
//         seconds: 10,
//       ),
//       lowerBound: 0,
//       upperBound: pi * 2,
//     );
//     animationController.repeat();
//
//     Provider.of<Connectivity_Provider>(context, listen: false)
//         .ChackInternetConnectivity();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     animationController.dispose();
//   }
//
//   LoadJsonData() async {
//     await Provider.of<LocalJsonData_Provider>(context, listen: false)
//         .LoadJsonData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     LocalJsonData_Provider localJsonData_ProviderTrue = Provider.of(context);
//     LocalJsonData_Provider localJsonData_ProviderFalse =
//         Provider.of(context, listen: false);
//
//     Theme_Provider theme_providerTrue = Provider.of(context);
//     Size s = MediaQuery.of(context).size;
//     double h = s.height;
//     double w = s.width;
//     return (Provider.of<Connectivity_Provider>(context).c1.status == "Waiting")
//         ? Container(
//             height: h,
//             width: w,
//             decoration: BoxDecoration(
//               image: (theme_providerTrue.t1.isDark)
//                   ? DecorationImage(
//                       image: AssetImage("assets/images/bgGalaxy.png"),
//                       fit: BoxFit.cover,
//                     )
//                   : DecorationImage(
//                       image: AssetImage("assets/images/bgWhite.png"),
//                       fit: BoxFit.cover,
//                     ),
//             ),
//             alignment: Alignment.center,
//             child: Image.asset("assets/images/network.png"),
//           )
//         : Container(
//             height: h,
//             width: w,
//             decoration: BoxDecoration(
//               image: (theme_providerTrue.t1.isDark)
//                   ? DecorationImage(
//                       image: AssetImage("assets/images/fp.gif"),
//                       fit: BoxFit.cover,
//                     )
//                   : DecorationImage(
//                       image: AssetImage("assets/images/fp.gif"),
//                       fit: BoxFit.cover,
//                     ),
//             ),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           height: h * 0.85,
//                           width: w,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: localJsonData_ProviderFalse
//                                 .l1.PlanetsList.length,
//                             itemBuilder: (context, i) => Hero(
//                               tag: localJsonData_ProviderFalse
//                                   .l1.PlanetsList[i].hero,
//                               flightShuttleBuilder:
//                                   (context, _, __, ___, ____) {
//                                 return Container(
//                                   height: h,
//                                   width: w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff01203f),
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/bgGalaxy.png"),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     localJsonData_ProviderFalse
//                                         .l1.PlanetsList[i].image,
//                                     height: h * 0.2,
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 height: h * 0.5,
//                                 width: w * 0.75,
//                                 margin: EdgeInsets.only(left: 15),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(40),
//                                   color: Colors.purple.withOpacity(0.4),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(15),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           TweenAnimationBuilder(
//                                             duration: Duration(seconds: 10),
//                                             curve: Curves.easeInOut,
//                                             tween: Tween<double>(
//                                                 begin: begin, end: end),
//                                             child: Container(
//                                               height: h * 0.2,
//                                               width: w,
//                                               child: Image.asset(
//                                                   localJsonData_ProviderTrue
//                                                       .l1.PlanetsList[i].image
//
//                                                   // height: h * 0.3,
//                                                   ),
//                                             ),
//                                             onEnd: () {},
//                                             builder:
//                                                 (context, degree, widget) =>
//                                                     Transform.rotate(
//                                               angle: degree,
//                                               child: widget,
//                                             ),
//                                           ),
//                                           Container(
//                                             height: h * 0.1,
//                                             width: w,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(35),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.white54
//                                                       .withOpacity(0.4),
//                                                 ),
//                                                 BoxShadow(
//                                                     color: Color(0xff6824a4),
//                                                     spreadRadius: 0.0,
//                                                     blurRadius: 20.0,
//                                                     offset: Offset(6, 5)),
//                                               ],
//                                             ),
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               "Name : ${localJsonData_ProviderTrue.l1.PlanetsList[i].name}",
//                                               style: GoogleFonts.almarai(
//                                                 textStyle: TextStyle(
//                                                   fontSize: h * 0.03,
//                                                   color: (theme_providerTrue
//                                                           .t1.isDark)
//                                                       ? Colors.white
//                                                       : Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                   letterSpacing: 0.5,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: h * 0.02,
//                                           ),
//                                           Container(
//                                             height: h * 0.1,
//                                             width: w,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(35),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.white54
//                                                       .withOpacity(0.4),
//                                                 ),
//                                                 BoxShadow(
//                                                     color: Color(0xff6824a4),
//                                                     spreadRadius: 0.0,
//                                                     blurRadius: 20.0,
//                                                     offset: Offset(6, 5)),
//                                               ],
//                                             ),
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               "Temperature :${localJsonData_ProviderTrue.l1.PlanetsList[i].temperature}",
//                                               style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: h * 0.02,
//                                                   fontWeight: FontWeight.bold,
//                                                   letterSpacing: 0.5,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: h * 0.02,
//                                           ),
//                                           Container(
//                                             height: h * 0.1,
//                                             width: w,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(35),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.white54
//                                                       .withOpacity(0.4),
//                                                 ),
//                                                 BoxShadow(
//                                                     color: Color(0xff6824a4),
//                                                     spreadRadius: 0.0,
//                                                     blurRadius: 20.0,
//                                                     offset: Offset(6, 5)),
//                                               ],
//                                             ),
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               "Velocity : ${localJsonData_ProviderTrue.l1.PlanetsList[i].velocity}",
//                                               style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: h * 0.02,
//                                                   fontWeight: FontWeight.bold,
//                                                   letterSpacing: 0.5,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: h * 0.02,
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Navigator.of(context).pushNamed(
//                                                   "SecondPage",
//                                                   arguments:
//                                                       localJsonData_ProviderFalse
//                                                           .l1.PlanetsList[i]);
//                                             },
//                                             child: Container(
//                                               height: h * 0.1,
//                                               width: w,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(35),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Colors.white54
//                                                         .withOpacity(0.4),
//                                                   ),
//                                                   BoxShadow(
//                                                       color: Color(0xff6824a4),
//                                                       spreadRadius: 0.0,
//                                                       blurRadius: 20.0,
//                                                       offset: Offset(6, 5)),
//                                                 ],
//                                               ),
//                                               alignment: Alignment.center,
//                                               child: Text(
//                                                 "Tap for More Info",
//                                                 style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                     fontStyle: FontStyle.italic,
//                                                     fontSize: h * 0.025,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }
