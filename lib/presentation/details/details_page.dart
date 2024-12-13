import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
