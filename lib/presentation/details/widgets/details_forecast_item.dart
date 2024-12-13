import 'package:city_weather/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsForecastItem extends StatelessWidget {
  const DetailsForecastItem({super.key, required this.forecast});

  final Weather forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _formatDateAndHour(forecast.timestamp),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'Temperature: ${forecast.temperature}°C',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Humidity: ${forecast.humidity}%',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Wind Speed: ${forecast.windSpeed} m/s',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Description: ${forecast.description}',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  String _formatDateAndHour(DateTime dateTime) {
    return DateFormat('dd/MM HH:mm').format(dateTime);
  }
}
