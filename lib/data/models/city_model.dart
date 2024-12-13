class CityModel {
  final String cityName;
  final String countryName;
  final String countryCode;
  final double latitude;
  final double longitude;

  const CityModel({
    required this.cityName,
    required this.countryName,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      cityName: json['cityName'] ?? '',
      countryName: json['countryName'] ?? '',
      countryCode: json['countryCode'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'cityName': cityName,
    'countryName': countryName, 
    'countryCode': countryCode,
    'latitude': latitude,
    'longitude': longitude,
  };
} 