import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:practica_fe/views/layout_template/layout_template.dart';

class Caller {
  var dio = Dio();
  String baseUrl = "http://localhost:8080/";

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<String> serverTest() async {
    try {
      String url = baseUrl + 'users/welcome';
      var response = await dio.get(url);
      return response.data;
    } catch (ex) {
      return ex.toString();
    }
  }

  Future<String> loginRequest({email = "", password = ""}) async {
    try {
      var params = {"email": email, "password": password};
      var url = baseUrl + 'users/login';
      var data = jsonEncode(params);
      logger.i(
          'Trying login for EMAIL = { $email }  on URL = { $url } DATA = $data');
      var response = await dio.post(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
        data: data,
      );
      navBar.myState.refresh();
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
      var params = {
        "email": email,
        "password": password,
        "firstName": firstname,
        "lastName": lastname,
        "birthDate": birthday
      };
      var url = baseUrl + 'users/register';
      var data = jsonEncode(params);
      logger.i(
          'Trying register for EMAIL = { $email }  on URL = { $url } DATA = $data');
      var response = await dio.post(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
        data: data,
      );
      if (response.statusCode != 200) {
        return response.data["message"];
      }
      return email;
    } catch (ex) {
      print(ex.toString());
      return 'server error...';
    }
  }

  Future<String> createArticleRequest(
      {String title = "",
      String content = "",
      String section = "",
      String email = ""}) async {

    try {
      var params = {
        "author": email,
        "title": title,
        "text": content,
        "subject": section
      };

      var url = baseUrl + 'articles/create';
      var data = jsonEncode(params);

      logger.i(
          'Trying create article for TITLE = { $title }, SECTION = { $section }'
              ' by EMAIL = { $email }  on URL = { $url } DATA = $data');

      var response = await dio.post(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
        data: data,
      ).catchError((error, stackTrace) {
      throw new Exception(error.toString());
      }).onError((error, stackTrace) {
      throw new Exception(error.toString());
      });
      if (response.statusCode != 200) {
        return response.data["message"];
      }
      return "Succes";

    } catch (ex) {
      logger.i(ex.toString());
      return "server error...";
    }
  }
}
