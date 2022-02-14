import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practica_fe/main.dart';
import 'package:practica_fe/routes/route_names.dart';

import '../../locator.dart';
import '../../services/navigation_service.dart';
import '../../utils/api_caller.dart';

class LoginContentDesktop extends StatefulWidget {
  const LoginContentDesktop({Key? key}) : super(key: key);

  @override
  State<LoginContentDesktop> createState() => _LoginContentDesktopState();
}

class _LoginContentDesktopState extends State<LoginContentDesktop> {
  bool showPassword = true;
  Color passwordIconColor = Colors.grey;

  final _eController = TextEditingController();
  final _pController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Autentifică-te acum pe \nrevista studențească',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Daca nu ești încă înregistrat',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => {
                      locator<NavigationService>().navigateTo(RegisterRoute)
                    },
                    child: Text(
                      'Inregistrează-te aici!',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/login_page_image.png',
              ),
            ),
            Expanded(
              child: _loginForm(
                  eController: _eController, pController: _pController),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginForm({eController, pController}) {
    var email = "";
    var password = "";

    Caller caller = Caller();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: eController,
          decoration: InputDecoration(
            hintText: 'Email',
            fillColor: Colors.blueGrey[50],
            filled: true,
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (Colors.blueGrey[50])!,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (Colors.blueGrey[50])!,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: _pController,
          obscureText: showPassword,
          decoration: InputDecoration(
            hintText: 'Parola',
            counterText: 'Ai uitat parola?',
            suffixIcon: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  showPassword = false;
                  passwordIconColor = Colors.deepPurple;
                });
              },
              onTapUp: (_) {
                setState(() {
                  showPassword = true;
                  passwordIconColor = Colors.grey;
                });
              },
              child: Container(
                child: Icon(
                  Icons.visibility_off_outlined,
                  color: passwordIconColor,
                ),
              ),
            ),
            fillColor: Colors.blueGrey[50],
            filled: true,
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (Colors.blueGrey[50])!,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (Colors.blueGrey[50])!,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.deepPurple,
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            child: Container(
              width: double.infinity,
              height: 50,
              child: const Center(
                child: Text(
                  'Autentifică-te',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () async {
              email = _eController.text;
              password = _pController.text;
              caller.loginRequest(email: email, password: password).then(
                (value) async {
                  if (value != 'server error...') {
                    GlobalData.email = value.split(' ')[0];
                    GlobalData.role = value.split(' ')[1];
                    GlobalData.logged = true;

                    Fluttertoast.showToast(
                        msg: "Logged in as $value",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    locator<NavigationService>().navigateTo('home');
                  } else {
                    Fluttertoast.showToast(
                        msg: value,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
