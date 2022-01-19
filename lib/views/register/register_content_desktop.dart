import 'package:flutter/material.dart';

class RegisterContentDesktop extends StatefulWidget {
  const RegisterContentDesktop({Key? key}) : super(key: key);

  @override
  _RegisterContentDesktopState createState() => _RegisterContentDesktopState();
}

class _RegisterContentDesktopState extends State<RegisterContentDesktop> {
  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

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
                children: const <Widget>[
                  Text(
                    'Înregistrează-te acum pe \nrevista studențească',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Daca ai deja un cont',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Autentifică-te aici!',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
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
              child: _registerForm(),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _firstnameController,
          decoration: InputDecoration(
            hintText: 'Prenume',
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
          controller: _lastnameController,
          decoration: InputDecoration(
            hintText: 'Nume',
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
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Introduceți email-ul',
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
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Introduceți parola',
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
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Reintroduceți parola',
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
                  'Înregistrează-te',
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
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
