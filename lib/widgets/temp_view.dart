import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp!.day!.toStringAsFixed(0);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon,
            scale: 0.7,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                '$temp  °C',
                style: TextStyle(fontSize: 54, color: Colors.pinkAccent),
              )
            ],
          )
        ],
      ),
    );
  }
}
