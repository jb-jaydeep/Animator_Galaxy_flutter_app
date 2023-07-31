import 'package:flutter/material.dart';
import 'package:pr_6_flutter_app/views/detailpage.dart';
import 'package:pr_6_flutter_app/views/screens/FirstPage.dart';
import 'package:pr_6_flutter_app/views/screens/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Componets/homepages.dart';
import 'Controllers/Provider.dart';
import 'Globals/Global.dart';
import 'Models/AllModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences Pref = await SharedPreferences.getInstance();
  bool isDark = Pref.getBool("isDark") ?? false;
  bool isNotification = Pref.getBool("isNotification") ?? false;
  List<String> favoriteName = Pref.getStringList("FavoriteName") ?? [];
  List<String> favoriteImage = Pref.getStringList("FavoriteImage") ?? [];
  List<String> favoriteDescription =
      Pref.getStringList("FavoriteDescription") ?? [];
  bool isFavorite = Pref.getBool("isFavorite") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalJsonData_Provider()),
        ChangeNotifierProvider(
            create: (context) => Theme_Provider(
                t1: Theme_Model(isDark: isDark, notification: isNotification))),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) => Favorite_Provider(
                f1: Favorite_model(
                    favoriteName: favoriteName,
                    favoriteImage: favoriteImage,
                    favoriteDescription: favoriteDescription,
                    favorite: isFavorite))),
        ChangeNotifierProvider(create: (context) => Connectivity_Provider()),
        ChangeNotifierProvider(create: (context) => CurrentIndex_Provider()),
      ],
      builder: (context, child) => MaterialApp(
        theme: Global.ligth_Theme,
        darkTheme: Global.dark_Theme,
        themeMode: (Provider.of<ThemeProvider>(context).isdark)
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashScreen(),
          "FirstPage": (context) => FirstPage(),
          "homepages": (context) => homepages(),
          "DetailPage": (context) => detailPage(),
        },
      ),
    ),
  );
}
