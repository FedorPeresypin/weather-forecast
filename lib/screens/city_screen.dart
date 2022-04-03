import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _cityName = 'nizhny novgorod';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(hintText: 'Enter city name...'),
                    onChanged: (value) {
                      _cityName = value;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, _cityName);
                  },
                  child: SizedBox(
                    width: 100,
                    height: 33,
                    child: Center(child: Text('Enter')),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
