class weather {
  final String cityname;
  final double teb;
  final String maicond;
  weather({
    required this.cityname,
    required this.teb,
    required this.maicond,
  });
  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(
      cityname: json['name'] ?? '',
      teb: json['main']['temp']?.toDouble() ?? 0.0,
      maicond: json['weather'][0]['main'] ?? '',
    );
  }
}
