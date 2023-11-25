import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

// Clima is a cutting-edge application developed as part of Angela Yu's bootcamp,
// designed to provide real-time weather information. Leveraging the power of the OpenWeather API,
// Clima fetches and displays up-to-the-minute weather data, ensuring users stay informed
// about the current climate conditions. With a sleek and intuitive interface,
// this project offers a seamless experience for users seeking accurate and timely weather updates..

// Clima est une application de pointe développée dans le cadre du bootcamp d'Angela Yu,
//conçue pour fournir des informations météorologiques en temps réel.
//S'appuyant sur la puissance de l'API OpenWeather,
//Clima récupère et affiche des données météorologiques de dernière minute,
// ce qui permet aux utilisateurs de rester informés
//des conditions climatiques actuelles. Avec une interface élégante et intuitive,
// ce projet offre une expérience transparente aux utilisateurs
//qui recherchent des mises à jour météorologiques précises et opportunes.

//Ousmanou Mamoudou

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  Fonction principale qui initialise et lance l'application.
    //  Main function that initializes and launches the application.
    return MaterialApp(
      //  Désactive la bannière de débogage en mode développement.
      //  Disables the debug banner in development mode.
      debugShowCheckedModeBanner: false,
      //  Thème global de l'application, mode sombre activé.
      //  Global theme of the application, dark mode enabled.
      theme: ThemeData.dark(),
      //  Page d'accueil de l'application.
      //  Home page of the application.
      home: const LoadingScreen(),
    );
  }
}
