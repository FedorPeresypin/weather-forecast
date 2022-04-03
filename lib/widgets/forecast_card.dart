import 'package:flutter/material.dart';
import 'package:weather_app/utilities/forecast_util.dart';

import '../models/weather_forecast_daily.dart';

class ForecastCard extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;
  const ForecastCard(this.snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
    var fullDate = Util.getFormatedDate(date);
    var dayOfWeek = fullDate.split(',')[0];
    var tempDay = forecastList[index].temp!.day!.toStringAsFixed(0);
    var tempNight = forecastList[index].temp!.night!.toStringAsFixed(0);
    var iconUrl = forecastList[index].getIconUrl();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dayOfWeek,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(iconUrl),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '  day ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$tempDay \u2103',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'night ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$tempNight \u2103',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
