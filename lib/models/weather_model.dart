class WeatherModel {
  final Location location;
  final Forecast forecast;
  final Current current;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}

class Location {
  final String cityName;

  Location({required this.cityName});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(cityName: json['name']);
  }
}

class Current {
  final DateTime date;

  Current({required this.date});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(date: DateTime.parse(json['last_updated']));
  }
}

class Forecast {
  final List<ForecastDay> forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
        forecastDay: List.from(json['forecastday'])
            .map((e) => ForecastDay.fromJson(e))
            .toList());
  }
}

class ForecastDay {
  final Day day;

  ForecastDay({required this.day});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      day: Day.fromJson(json['day']),
    );
  }
}

class Day {
  final double temp;
  final double maxTemp;
  final double minTemp;
  final Condition condition;

  Day({
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      temp: json['avgtemp_c'],
      maxTemp: json['maxtemp_c'],
      minTemp: json['mintemp_c'],
      condition: Condition.fromJson(json['condition']),
    );
  }
}

class Condition {
  final String weatherStateName;
  final String image;

  Condition({
    required this.weatherStateName,
    required this.image,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      weatherStateName: json['text'],
      image: json['icon'],
    );
  }
}
