import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Cette classe représente un widget de chargement affiché pendant le chargement des données météorologiques.
// This class represents a loading widget displayed while fetching weather data.
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.size,
  });

  //  La taille du texte de chargement.
  //  The size of the loading text.
  final double size;

  @override
  Widget build(BuildContext context) {
    //  Retourne une colonne contenant un indicateur de chargement animé et un texte.
    //  Returns a column containing an animated loading spinner and a text.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  Indicateur de chargement animé avec des lignes en rotation.
        //  Animated loading spinner with spinning lines.
        Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: size,
          ),
        ),
        //  Texte indiquant "Météo En Temps Réelle" avec un style défini dans les constantes.
        //  Text indicating "Real-time Weather" with a style defined in constants.
        const Text(
          "Météo En Temps Réelle",
          style:
              kLoadingTextStyle, // Applique le style qui se trouve dans le fichier const dans le dossier utilities
          // Applying style from the file const inside folder utilities
        ),
      ],
    );
  }
}
