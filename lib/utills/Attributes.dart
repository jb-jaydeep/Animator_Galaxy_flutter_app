import 'package:pr_6_flutter_app/Componets/homepages.dart';

import '../Componets/FavoritePage.dart';
import '../Componets/HomePage.dart';
import '../Componets/SettingsPage.dart';

String jsonPath = "assets/json/planets.json";

List Pages = [
  FavoritePage(),
  // HomePage(),
  homepages(),
  SettingsPage(),
];

bool? isFavorite;
