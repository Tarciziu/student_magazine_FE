import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

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
            HttpHeaders.accessControlAllowOriginHeader: "*"
          },
        ),
        data: data,
      );
      return response.data['email'].toString();
    } catch (ex) {
      return 'server error...';
    }
  }
}
