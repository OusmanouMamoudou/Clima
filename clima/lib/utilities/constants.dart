import 'package:flutter/material.dart';

//  Style du texte pour afficher la température.
//  Text style for displaying temperature.
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

//  Style du texte pour afficher les messages.
//  Text style for displaying messages.
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kCountryTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

//  Style du texte pour les boutons.
//  Text style for buttons.
const kButtonTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

//  Style du texte pour le chargement.
//  Text style for loading.
const kLoadingTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

//  Style du texte pour afficher les conditions météorologiques.
//  Text style for displaying weather conditions.
const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

//  Clé API pour OpenWeatherMap.
//  API key for OpenWeatherMap.
const kOpenWeatherKey = '';

//  URL de base pour interroger l'API OpenWeatherMap.
//  Base URL to query the OpenWeatherMap API.
const kWeatherMap = 'https://api.openweathermap.org/data/2.5/weather?';

//  Style de champ de texte.
//  Style for the text field.
const kTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Entrez une ville...',
  hintStyle: TextStyle(
    color: Colors.black,
  ),
  icon: Icon(
    Icons.location_city,
    size: 40,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
