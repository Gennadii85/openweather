class WeatherDetailsModel {
  WeatherDetailsModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
  late final String cod;
  late final int message;
  late final int cnt;
  late final List<ListData> list;
  late final City city;

  WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    list = List.from(json['list']).map((e) => ListData.fromJson(e)).toList();
    city = City.fromJson(json['city']);
  }
}

class ListData {
  ListData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });
  late final int dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;
  late final int visibility;
  late final num? pop;
  late final Sys sys;
  late final String? dtTxt;

  ListData.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    clouds = Clouds.fromJson(json['clouds']);
    wind = Wind.fromJson(json['wind']);
    visibility = json['visibility'];
    pop = json['pop'];
    sys = Sys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });
  late final num temp;
  late final num feelsLike;
  late final num tempMin;
  late final num tempMax;
  late final int pressure;
  late final int seaLevel;
  late final int grndLevel;
  late final int humidity;
  late final num? tempKf;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  late final double speed;
  late final int deg;
  late final double? gust;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}

class Sys {
  Sys({
    required this.pod,
  });
  late final String? pod;

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

class DtTxt {
  DtTxt({
    required this.pod,
  });
  late final String pod;

  DtTxt.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
  late final int id;
  late final String name;
  late final Coord coord;
  late final String country;
  late final int population;
  late final int timezone;
  late final int sunrise;
  late final int sunset;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });
  late final double lat;
  late final double lon;

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
