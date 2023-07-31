import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/AllModel.dart';
import '../utills/Attributes.dart';

class Connectivity_Provider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  Connectivity_Model c1 = Connectivity_Model(status: "Waiting");

  ChackInternetConnectivity() {
    c1.connectivityStream = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult connectivityResult) {
        switch (connectivityResult) {
          case ConnectivityResult.wifi:
            c1.status = "WIFI";
            notifyListeners();
            break;

          case ConnectivityResult.mobile:
            c1.status = "MOBILE DATA";
            notifyListeners();
            break;

          default:
            c1.status = "Waiting";
            notifyListeners();
            break;
        }
      },
    );
  }
}

class CurrentIndex_Provider extends ChangeNotifier {
  CurrentIndex_model c1 = CurrentIndex_model(current_index: 1);

  changeCurrentIndex(int i) {
    c1.current_index = i;
    notifyListeners();
  }
}

class Favorite_Provider extends ChangeNotifier {
  Favorite_model f1;

  Favorite_Provider({required this.f1});

  addFavoriteValue(Planet data) async {
    data.favorite = !data.favorite;

    f1.favorite = data.favorite;

    if (f1.favorite) {
      f1.favorite = true;

      f1.favoriteName.add(data.name);
      f1.favoriteImage.add(data.image);
      f1.favoriteDescription.add(data.description);

      SharedPreferences Pref = await SharedPreferences.getInstance();

      Pref.setStringList("FavoriteName", f1.favoriteName);
      Pref.setStringList("FavoriteImage", f1.favoriteImage);
      Pref.setStringList("FavoriteDescription", f1.favoriteDescription);
    } else {
      f1.favorite = false;
      f1.favoriteName.remove(data.name);
      f1.favoriteImage.remove(data.image);
      f1.favoriteDescription.remove(data.description);

      SharedPreferences Pref = await SharedPreferences.getInstance();

      Pref.setStringList("FavoriteName", f1.favoriteName);
      Pref.setStringList("FavoriteImage", f1.favoriteImage);
      Pref.setStringList("FavoriteDescription", f1.favoriteDescription);
    }
    notifyListeners();
  }

  removeFavoriteValue(int i) async {
    f1.favoriteName.removeAt(i);
    f1.favoriteImage.removeAt(i);
    f1.favoriteDescription.removeAt(i);

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setStringList("FavoriteName", f1.favoriteName);
    Pref.setStringList("FavoriteImage", f1.favoriteImage);
    Pref.setStringList("FavoriteDescription", f1.favoriteDescription);
    notifyListeners();
  }
}

class LocalJsonData_Provider extends ChangeNotifier {
  LocalJsonData_Model l1 = LocalJsonData_Model(data: "", PlanetsList: []);

  Future<void> LoadJsonData() async {
    l1.data = await rootBundle.loadString(jsonPath);

    List decodeList = jsonDecode(l1.data);

    l1.PlanetsList = decodeList.map((e) => Planets.fromJson(e)).toList();
    notifyListeners();
  }
}

class Theme_Provider extends ChangeNotifier {
  Theme_Model t1;

  Theme_Provider({required this.t1});

  changeTheme() async {
    t1.isDark = !t1.isDark;

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setBool("isDark", t1.isDark);

    notifyListeners();
  }

  // changeNotification() async {
  //   t1.notification = !t1.notification;
  //   SharedPreferences Pref = await SharedPreferences.getInstance();
  //
  //   Pref.setBool("isNotification", t1.notification);
  //
  //   notifyListeners();
  // }
}

class ThemeProvider extends ChangeNotifier {
  bool isdark = false;
  void Themechanger() {
    isdark = !isdark;
    notifyListeners();
  }
}
