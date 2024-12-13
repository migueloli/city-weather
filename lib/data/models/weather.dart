class Weather {
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] ?? 0,
      main: json['main'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  final int id;
  final String main;
  final String description;
  final String icon;

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
