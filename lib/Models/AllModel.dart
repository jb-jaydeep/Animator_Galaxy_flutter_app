import 'dart:async';

class Planets {
  String no;
  String name;
  String diameter;
  String lengthOfYear;
  String leanthOfDay;
  String numberOfMoons;
  String temperature;
  String surfaceArea;
  String gravity;
  String velocity;
  String distance;
  String description;
  String image;
  String hero;
  List<String> images;
  bool favorite;

  Planets({
    required this.no,
    required this.name,
    required this.diameter,
    required this.lengthOfYear,
    required this.leanthOfDay,
    required this.numberOfMoons,
    required this.temperature,
    required this.surfaceArea,
    required this.gravity,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.image,
    required this.hero,
    required this.images,
    required this.favorite,
  });

  factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        no: json["no"],
        name: json["name"],
        diameter: json["diameter"],
        lengthOfYear: json["lengthOfYear"],
        leanthOfDay: json["leanthOfDay"],
        numberOfMoons: json["numberOfMoons"],
        temperature: json["temperature"],
        surfaceArea: json["surfaceArea"],
        gravity: json["gravity"],
        velocity: json["velocity"],
        distance: json["distance"],
        description: json["description"],
        image: json["image"],
        hero: json["hero"],
        images: List<String>.from(json["images"].map((e) => e)),
        favorite: false,
      );
}

class Theme_Model {
  bool isDark;
  bool notification;

  Theme_Model({
    required this.isDark,
    required this.notification,
  });
}

class Planet {
  String no;
  String name;
  String diameter;
  String lengthOfYear;
  String leanthOfDay;
  String numberOfMoons;
  String temperature;
  String surfaceArea;
  String gravity;
  String velocity;
  String distance;
  String description;
  String image;
  String hero;
  List<String> images;
  bool favorite;

  Planet({
    required this.no,
    required this.name,
    required this.diameter,
    required this.lengthOfYear,
    required this.leanthOfDay,
    required this.numberOfMoons,
    required this.temperature,
    required this.surfaceArea,
    required this.gravity,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.image,
    required this.hero,
    required this.images,
    required this.favorite,
  });

  factory Planet.fromJson({required Map Data}) => Planet(
        no: Data["no"],
        name: Data["name"],
        diameter: Data["diameter"],
        lengthOfYear: Data["lengthOfYear"],
        leanthOfDay: Data["leanthOfDay"],
        numberOfMoons: Data["numberOfMoons"],
        temperature: Data["temperature"],
        surfaceArea: Data["surfaceArea"],
        gravity: Data["gravity"],
        velocity: Data["velocity"],
        distance: Data["distance"],
        description: Data["description"],
        image: Data["image"],
        hero: Data["hero"],
        images: List<String>.from(Data["images"].map((e) => e)),
        favorite: false,
      );
}

class Connectivity_Model {
  String status;
  StreamSubscription? connectivityStream;

  Connectivity_Model({required this.status, this.connectivityStream});
}

class CurrentIndex_model {
  int current_index;

  CurrentIndex_model({
    required this.current_index,
  });
}

class LocalJsonData_Model {
  String data;
  List<Planets> PlanetsList;

  LocalJsonData_Model({
    required this.data,
    required this.PlanetsList,
  });
}

class Favorite_model {
  List<String> favoriteName;
  List<String> favoriteImage;
  List<String> favoriteDescription;
  bool favorite;

  Favorite_model({
    required this.favoriteName,
    required this.favoriteImage,
    required this.favoriteDescription,
    required this.favorite,
  });
}
