import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/city_view.dart';

class WeatherForecastSreen extends StatefulWidget {
  const WeatherForecastSreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastSreen> createState() => _WeatherForecastSreenState();
}

class _WeatherForecastSreenState extends State<WeatherForecastSreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'Nizhny Novgorod';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
    forecastObject.then((value) => print(value.list![0].weather![0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Пук'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      CityView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
