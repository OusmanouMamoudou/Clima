import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: SpinKitSpinningLines(
          color: Colors.white,
          size: size,
        )),
        const Text(
          "Météo En Temps Réelle",
          style: kLoadingTextStyle,
        )
      ],
    );
  }
}
