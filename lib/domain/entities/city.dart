class City {
  final String cityName;
  final String countryName;
  final String countryCode;

  const City({
    required this.cityName,
    required this.countryName,
    required this.countryCode,
  });

  String get fullName => '$cityName, $countryName';
  String get shortName => '$cityName, $countryCode';
} 