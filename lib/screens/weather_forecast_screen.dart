import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastSreen extends StatefulWidget {
  const WeatherForecastSreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastSreen> createState() => _WeatherForecastSreenState();
}

class _WeatherForecastSreenState extends State<WeatherForecastSreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'nizhny novgorod';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
    forecastObject.then((value) => print(value.list![0].weather![0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Прогноз погоды'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
                });
              }
            },
            icon: Icon(Icons.location_city),
          ),
        ],
      ),
      body: FutureBuilder<WeatherForecast>(
        future: forecastObject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(height: 50),
                CityView(snapshot),
                SizedBox(height: 50),
                TempView(snapshot),
                SizedBox(height: 50),
                DetailView(snapshot),
                SizedBox(height: 50),
                BottomListView(snapshot),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
