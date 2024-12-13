class Coordinates {
  const Coordinates({required this.lon, required this.lat});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lon: json['lon']?.toDouble() ?? 0.0,
      lat: json['lat']?.toDouble() ?? 0.0,
    );
  }

  final double lon;
  final double lat;

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };
}
