import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kLoadingTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kOpenWeatherKey = '25604c7426f983069376dcaef3158c92';
const kWeatherMap = 'https://api.openweathermap.org/data/2.5/weather?';

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
