import 'package:flutter/material.dart';
import 'package:weather_app/widgets/forecast_card.dart';

import '../models/weather_forecast_daily.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '7-day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 9),
            itemCount: snapshot.data!.list!.length,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.black87,
              child: ForecastCard(snapshot, index),
            ),
          ),
        )
      ],
    );
  }
}
