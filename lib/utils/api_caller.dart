import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:practica_fe/views/layout_template/layout_template.dart';
import 'package:practica_fe/widgets/navigation_bar/navigation_bar.dart';
import 'package:practica_fe/widgets/navigation_bar/navigation_bar_desktop.dart';

import '../main.dart';

class Caller {
  var dio = Dio();
  String baseUrl = "http://localhost:8080/";

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<String> serverTest() async {
    try {
      String URL = baseUrl + 'users/welcome';
      var response = await dio.get(URL);
      return response.data;
    } catch (ex) {
      return ex.toString();
    }
  }

  Future<String> loginRequest({email = "", password = ""}) async {
    try {
      var params = {"email": email, "password": password};
      var URL = baseUrl + 'users/login';
      var data = jsonEncode(params);
      logger.i(
          'Trying login for EMAIL = { $email }  on URL = { $URL } DATA = $data');
      var response = await dio.post(
        URL,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
        data: data,
      );
      navBar.MyState.refresh();
      return response.data['email'].toString();
    } catch (ex) {
      print(ex.toString());
      return 'server error...';
    }
  }

  Future<String> registerRequest(
      {String email = "",
      String password = "",
      String firstname = "",
      String lastname = "",
      String birthday = ""}) async {

    try {
      var params = {"email": email, "password": password, "firstName": firstname,
      "lastName": lastname, "birthDate": birthday};
      var URL = baseUrl + 'users/register';
      var data = jsonEncode(params);
      logger.i(
          'Trying register for EMAIL = { $email }  on URL = { $URL } DATA = $data');
      var response = await dio.post(
        URL,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
        data: data,
      );
      if (response.statusCode != 200){
        return response.data["message"];
      }
      return email;
    } catch (ex) {
      print(ex.toString());
      return 'server error...';
    }

    return email;
  }
}
