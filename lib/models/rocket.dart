class Rocket {
  final String rocketId;
  final String rocketName;
  String firstFlightDate;
  final String description;
  final String country;
  final String company;
  final int boosters;
  final int successRate;
  final int costPerLaunch;
  final Height height;
  final Diameter diameter;
  final Mass mass;
  final Engines engines;
  List<String> images;
  final SecondStage secondStage;

  Rocket(
      {this.rocketId,
      this.rocketName,
      this.successRate,
      this.firstFlightDate,
      this.description,
      this.boosters,
      this.costPerLaunch,
      this.country,
      this.company,
      this.height,
      this.diameter,
      this.mass,
      this.engines,
      this.images,
      this.secondStage});

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: json['id'],
        rocketName: json['name'],
        successRate: json['success_rate_pct'],
        firstFlightDate: json['first_flight'],
        description: json['description'],
        boosters: json['boosters'],
        costPerLaunch: json['cost_per_launch'],
        country: json['country'],
        company: json['company'],
        images: jsonPlaces(json['flickr_images']),
        height: Height.fromJson(json['height']),
        diameter: Diameter.fromJson(json['diameter']),
        mass: Mass.fromJson(json['mass']),
        engines: Engines.fromJson(json['engines']),
        secondStage: SecondStage.fromJson(json['second_stage']),
      );
  static List<String> jsonPlaces(json) {
    List<String> placesList = new List<String>.from(json);
    return placesList;
  }
}

class Height {
  dynamic meters;
  dynamic feet;

  Height({this.meters, this.feet});

  factory Height.fromJson(Map<String, dynamic> json) => Height(
        meters: json['meters'],
        feet: json['feet'],
      );
}

class Diameter {
  dynamic meters;
  dynamic feet;

  Diameter({this.meters, this.feet});

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json['meters'],
        feet: json['feet'],
      );
}

class Mass {
  dynamic kg;
  dynamic lb;

  Mass({this.kg, this.lb});

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json['kg'],
        lb: json['lb'],
      );
}

class Engines {
  final int number;
  final String type;
  final String version;
  final String layout;
  final Isp isp;

  Engines({this.number, this.type, this.version, this.layout, this.isp});

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
        number: json['number'],
        type: json['type'],
        version: json['version'],
        layout: json['layout'],
        isp: Isp.fromJson(json['isp']),
      );
}

class Isp {
  final int seaLevel;
  final int vacuum;

  Isp({this.seaLevel, this.vacuum});

  factory Isp.fromJson(Map<String, dynamic> json) => Isp(
        seaLevel: json['sea_level'],
        vacuum: json['vacuum'],
      );
}

class SecondStage {
  bool reusable;
  int engines;
  var fuelAmountTons;
  int burnTimeSec;

  SecondStage(
      {this.reusable, this.engines, this.fuelAmountTons, this.burnTimeSec});

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        reusable: json['reusable'],
        engines: json['engines'],
        fuelAmountTons: json['fuel_amount_tons'],
        burnTimeSec: json['burn_time_sec'],
      );
}
