class Weather {
  const Weather({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.name,
    required this.description,
    required this.icon,
    required this.timestamp,
  });

  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String name;
  final String description;
  final String icon;
  final DateTime timestamp;
}
