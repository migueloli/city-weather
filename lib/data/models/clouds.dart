class Clouds {
  const Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all'] ?? 0);
  }

  final int all;

  Map<String, dynamic> toJson() => {'all': all};
}
