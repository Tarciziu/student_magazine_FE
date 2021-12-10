import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
        sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? TextAlign.left
            : TextAlign.left;
        double titleSize =
        sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? 40
            : 20;

        double descriptionSize =
        sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? 21
            : 14;

        return SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Echipa:',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 0.9,
                    fontSize: titleSize),
                textAlign: textAlignment,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Front-End:\n       Balotă George\n       Gologan Christin-Tarciziu\n'
                    'Back-End:\n       Dochițoiu Edoardo-Eugenio\n       '
                    'Istudor Delia\n       Salló Attila',
                style: TextStyle(
                  fontSize: descriptionSize,
                  height: 1.7,
                ),
                textAlign: textAlignment,
              )
            ],
          ),
        );
      },
    );
  }
}
