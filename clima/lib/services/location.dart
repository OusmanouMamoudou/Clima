import 'package:geolocator/geolocator.dart';

class Location {
  //  Variables pour stocker la latitude et la longitude.
  //  Variables to store latitude and longitude.
  double? latitude, longitude;

  //  Fonction asynchrone pour obtenir la localisation actuelle.
  //  Asynchronous function to get the current location.
  Future<void> getLocation() async {
    try {
      //  Demander la permission d'accéder à la localisation.
      //  Request permission to access location.
      // ignore: unused_local_variable
      LocationPermission permission = await Geolocator.requestPermission();

      //  Obtenir la position actuelle avec une précision basse ceci minimise l'utilisation de la battérie.
      //  Get the current position with low accuracy.
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      //  Stocker la latitude et la longitude obtenues.
      //  Store the obtained latitude and longitude.
      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      //  Gérer les erreurs en affichant le message d'erreur.
      //  Handle errors by printing the error message.
      print(e);
    }
  }
}
