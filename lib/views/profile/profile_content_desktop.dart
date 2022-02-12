import 'package:flutter/material.dart';
import 'package:practica_fe/main.dart';
import 'package:practica_fe/utils/api_caller.dart';

class ProfileContentDesktop extends StatefulWidget {
  const ProfileContentDesktop({Key? key}) : super(key: key);

  @override
  _ProfileContentDesktopState createState() => _ProfileContentDesktopState();
}

class _ProfileContentDesktopState extends State<ProfileContentDesktop> {
  Caller caller = Caller();
  String email = "";
  String role = "";
  String firstName = "";
  String lastName = "";
  String birthDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.centerRight,
              widthFactor: .6,
              child: Image.asset('assets/images/profile_page_image.png'),
            ),
            FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .6,
                child: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Profilul tău',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: 40,
                        endIndent: 400,
                        thickness: 1,
                      ),
                      displayData(name: "Email", data: email),
                      displayData(name: "Prenume", data: firstName),
                      displayData(name: "Nume", data: lastName),
                      displayData(name: "Data nasterii", data: birthDate),
                      displayData(name: "Rol", data: role)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    caller.getUser(email: GlobalData.email).then((value) {
      var splittedValue = value.split(' ');
      email = GlobalData.email;
      role = GlobalData.role;
      lastName = splittedValue[0];
      firstName = splittedValue[1];
      birthDate = splittedValue[2];
      setState(() {});
    });
  }

  Widget displayData({required String name, required String data}) {
    return Row(
      children: [
        SizedBox(
          width: 60,
        ),
        Text(
          name + ": ",
          style: TextStyle(
            fontSize: 26,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          data,
          style: TextStyle(fontSize: 26),
        )
      ],
    );
  }
}
