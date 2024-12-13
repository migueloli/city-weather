class Rain {
  const Rain({this.oneHour, this.threeHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h']?.toDouble(),
      threeHour: json['3h']?.toDouble(),
    );
  }

  final double? oneHour;
  final double? threeHour;

  Map<String, dynamic> toJson() => {
        if (oneHour != null) '1h': oneHour,
        if (threeHour != null) '3h': threeHour,
      };
}
