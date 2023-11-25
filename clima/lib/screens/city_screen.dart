import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  //  Nom de la ville entré par l'utilisateur.
  //  City name entered by the user.
  String? cityName;

  @override
  Widget build(BuildContext context) {
    //  Retourne la structure de l'écran pour saisir le nom de la ville.
    //  Returns the screen structure for entering the city name.
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/city_background.jpg'), // L'arriére plan - Background Image
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              //  Bouton pour revenir en arrière à l'écran précédent.
              //  Button to navigate back to the previous screen.
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              //  Zone de texte pour entrer le nom de la ville.
              //  Text field for entering the city name.
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextFieldStyle,
                  onChanged: (value) {
                    cityName =
                        value; // Mettre la valeur saisie dans la variable cityName
                    // Updating the cityName with typed value
                  },
                ),
              ),
              //  Bouton pour voir la météo actuelle de la ville entrée.
              //  Button to view the current weather of the entered city.
              TextButton(
                onPressed: () {
                  Navigator.pop(context,
                      cityName); // Retour en envoi de la variable cityName à l'écran location_screen
                  // Getting back and sending cityName to  location_screen
                },
                child: const Text(
                  'Voir la Météo Actuelle',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
