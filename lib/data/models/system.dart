class System {
  const System({
    this.type,
    this.id,
    required this.country,
    this.sunrise,
    this.sunset,
    this.pod,
  });

  factory System.fromJson(Map<String, dynamic> json) {
    return System(
      type: json['type'],
      id: json['id'],
      country: json['country'] ?? '',
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      pod: json['pod'],
    );
  }

  final int? type;
  final int? id;
  final String country;
  final int? sunrise;
  final int? sunset;
  final String? pod;

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (id != null) 'id': id,
        'country': country,
        if (sunrise != null) 'sunrise': sunrise,
        if (sunset != null) 'sunset': sunset,
        if (pod != null) 'pod': pod,
      };
}
