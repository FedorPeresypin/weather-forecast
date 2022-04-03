import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var presure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Util.getItem(FontAwesomeIcons.temperatureThreeQuarters,
            presure.round().toString(), "mm Hg"),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity.toString(), "%"),
        Util.getItem(FontAwesomeIcons.wind, wind.toString(), "m/s")
      ],
    );
  }
}
