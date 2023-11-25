import 'package:clima/components/loading_widget.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherData});
  final dynamic weatherData;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature, condition;
  String? cityName, iconTemp, message;
  bool loadingCity = false;

  WeatherModel weatherModel = WeatherModel();
  void updateVar(weatherData) {
    if (weatherData != null) {
      double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      condition = weatherData["weather"][0]["id"];
      cityName = weatherData["name"];

      iconTemp = weatherModel.getWeatherIcon(condition!);
      message = weatherModel.getMessage(temperature!);
      return;
    } else {
      temperature = 0;
      condition = 0;
      cityName = '';
      iconTemp = 'E';
      message = 'Impossible de récuperer les informations';
    }
  }

  @override
  void initState() {
    super.initState();
    updateVar(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: loadingCity == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () async {
                            var weatherData =
                                await weatherModel.getCurrentLocationW();
                            updateVar(weatherData);
                          },
                          child: const Icon(
                            Icons.near_me,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            var city = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CityScreen()));
                            if (city != null) {
                              setState(() {
                                loadingCity = true;
                              });
                              var weatherData =
                                  await weatherModel.getCityNameW(city);

                              setState(() {
                                loadingCity = false;
                                updateVar(weatherData);
                              });
                            }
                          },
                          child: const Icon(
                            Icons.location_city,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              cityName!,
                              textAlign: TextAlign.center,
                              style: kMessageTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$temperature°",
                                style: kTempTextStyle,
                              ),
                              Text(
                                iconTemp!,
                                style: kConditionTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, bottom: 30),
                      child: Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: kMessageTextStyle,
                      ),
                    ),
                  ],
                )
              : const LoadingWidget(size: 50),
        ),
      ),
    );
  }
}
