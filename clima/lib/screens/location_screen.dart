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
  //  Variables pour stocker les données météorologiques.
  //  Variables to store weather data.
  int? temperature, condition;
  String? countryName, cityName, iconTemp, message;
  bool loadingCity = false;

  WeatherModel weatherModel = WeatherModel();

  //  Fonction pour mettre à jour les variables avec les données météorologiques.
  //  Function to update variables with weather data.
  void updateVar(weatherData) {
    if (weatherData != null) {
      double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      condition = weatherData["weather"][0]["id"];
      cityName = weatherData["name"];
      String country = weatherData["sys"]["country"];
      countryName = weatherModel.getCountry(country);

      iconTemp = weatherModel.getWeatherIcon(condition!);
      message = weatherModel.getMessage(temperature!);
      return;
    } else {
      // Dans le cas ou weatherData est null
      // In case that weathear Data is null
      temperature = 0;
      condition = 0;
      cityName = '';
      iconTemp = 'E';
      message = 'Impossible de récupérer les informations';
      countryName = "";
    }
  }

  @override
  void initState() {
    super.initState();
    //  Mettre à jour les variables avec les données initiales.
    //  Update variables with initial data.
    updateVar(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                'images/location_background.jpg'), // Arriére Plan - Background
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
                    //  Ligne contenant les boutons pour obtenir la météo actuelle ou choisir une ville.
                    //  Row containing buttons to get current weather or choose a city.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Tooltip(
                          message: "Selon votre Localisation",
                          child: TextButton(
                            onPressed: () async {
                              setState(() {
                                loadingCity = true;
                              });
                              var weatherData =
                                  await weatherModel.getCurrentLocationW();
                              setState(() {
                                loadingCity = false;
                                updateVar(weatherData);
                              });
                            },
                            child: const Icon(
                              Icons.near_me,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                        ),
                        Tooltip(
                          message: "Selon des villes",
                          child: TextButton(
                            onPressed: () async {
                              var city = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CityScreen(),
                                ),
                              );
                              if (city != null) {
                                setState(() {
                                  loadingCity =
                                      true; // Pour lancer le chargement - To start the loading
                                });
                                var weatherData = await weatherModel.getCityNameW(
                                    city); // Récuperation des données de l'écran city_screen

                                setState(() {
                                  loadingCity =
                                      false; // Pour arretr le chargement - To stop the loading
                                  updateVar(
                                      weatherData); // Mise à jour de l'écran avec la ville entrée
                                  // Updating the  screen with the typed city
                                });
                              }
                            },
                            child: const Icon(
                              Icons.location_city,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //  Section affichant le nom de la ville, la température et l'icône météo.
                    //  Section displaying city name, temperature, and weather icon.
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
                          if (countryName != "")
                            Center(
                              child: Text(
                                countryName!,
                                textAlign: TextAlign.center,
                                style: kCountryTextStyle,
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
                    //  Message informatif sous la section météo.
                    //  Informative message below the weather section.
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, bottom: 30),
                      child: kOpenWeatherKey == ""
                          ? const SingleChildScrollView(
                              child: Text(
                                "Please add your  OpenWeather key to use the App. ",
                                textAlign: TextAlign.center,
                                style: kCountryTextStyle,
                              ),
                            )
                          : Text(
                              message!,
                              textAlign: TextAlign.center,
                              style: kMessageTextStyle,
                            ),
                    ),
                  ],
                )
              // Afficher le widget de chargement avec une taille de 50.
              // Display the loading widget with a size of 50.
              : const LoadingWidget(size: 50),
        ),
      ),
    );
  }
}
