class Rain {
  final double? oneHour;
  final double? threeHour;

  Rain({this.oneHour, this.threeHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h']?.toDouble(),
      threeHour: json['3h']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (oneHour != null) '1h': oneHour,
    if (threeHour != null) '3h': threeHour,
  };
} 