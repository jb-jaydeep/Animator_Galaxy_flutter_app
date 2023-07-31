import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/Provider.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
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
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Favorite_Provider favorite_providerTrue = Provider.of(context);
    Favorite_Provider favorite_providerFalse =
        Provider.of(context, listen: false);

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: (Provider.of<ThemeProvider>(context).isdark)
              ? DecorationImage(
                  image: AssetImage("assets/images/bgGalaxy.png"),
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
              ListTile(
                title: Text(
                  "Favourite",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.035,
                  ),
                ),
              ),
              ...List.generate(
                favorite_providerTrue.f1.favoriteName.length,
                (i) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)),
                      child: Column(
                        children: [
                          Text(
                            favorite_providerTrue.f1.favoriteName[i],
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    (Provider.of<ThemeProvider>(context).isdark)
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: h * 0.035,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: animationController,
                            child: Image.asset(
                              favorite_providerTrue.f1.favoriteImage[i],
                            ),
                            builder: (context, widget) => Transform.rotate(
                              angle: animationController.value,
                              child: widget,
                            ),
                          ),
                          Text(
                            favorite_providerTrue.f1.favoriteDescription[i],
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    (Provider.of<ThemeProvider>(context).isdark)
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: h * 0.018,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              favorite_providerFalse.removeFavoriteValue(i);
                            },
                            icon: Icon(
                              Icons.delete,
                              color:
                                  (Provider.of<ThemeProvider>(context).isdark)
                                      ? Colors.white
                                      : Colors.black,
                              size: h * 0.03,
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
        ));
  }
}
