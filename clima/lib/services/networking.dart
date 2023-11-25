import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  //  URL de l'API à interroger.
  //  URL of the API to query.
  final String url;

  //  Constructeur qui prend l'URL de l'API.
  //  Constructor that takes the API's URL.
  NetworkHelper(this.url);

  //  Fonction asynchrone pour récupérer des données depuis l'API.
  //  Asynchronous function to retrieve data from the API.
  Future getData() async {
    //  Faire une requête HTTP GET à l'URL spécifiée.
    //  Make an HTTP GET request to the specified URL.
    http.Response response = await http.get(Uri.parse(url));

    //  Vérifier si la réponse a un code d'état 200 (OK).
    //  Check if the response has a status code of 200 (OK).
    if (response.statusCode == 200) {
      //  Extraire et décoder les données JSON de la réponse.
      //  Extract and decode the JSON data from the response.
      var data = response.body;
      return jsonDecode(data);
    } else {
      //  Afficher le code d'état de la réponse en cas d'erreur.
      //  Print the response status code in case of an error.
      print(response.statusCode);
    }
  }
}
