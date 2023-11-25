import 'package:clima/components/loading_widget.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // Latitude et longitude actuelles pour obtenir les données météorologiques.
  // Current latitude and longitude to obtain weather data.
  double? latitude, longitude;

  // Fonction asynchrone pour obtenir les données de localisation et démarrer l'écran de chargement.
  // Asynchronous function to get location data and navigate to the loading screen.
  Future<void> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getCurrentLocationW();
    if (!context.mounted) return;
    // Naviguer vers l'écran de localisation avec les données météorologiques obtenues.
    // Navigate to the location screen with the obtained weather data.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData: weatherData),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Appeler la fonction pour obtenir les données de localisation lors de l'initialisation de l'écran.
    // Call the function to get location data during screen initialization.
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    // Afficher le widget de chargement avec une taille de 100.
    // Display the loading widget with a size of 100.
    return const Scaffold(body: LoadingWidget(size: 100));
  }
}
