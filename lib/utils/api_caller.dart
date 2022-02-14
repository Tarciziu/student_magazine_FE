import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
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

  Future<CardArticleModel?> getArticleById({id}) async {
    try {
      var url = baseUrl + "articles/$id";
      logger.i('Trying getArticleById for ID = { $id }  on URL = { $url }');
      var response = await dio.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      return CardArticleModel.fromJSON(response.data);
    } catch (ex) {
      return null;
    }
  }

  Future<String> getUser({email = ""}) async {
    try {
      var url = baseUrl + 'users/getByEmail';
      logger.i('Getting data of user with EMAIL = {$email} on URL = { $url }');
      var response = await dio.post(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: email,
      );
      return response.data["firstName"].toString() +
          " " +
          response.data["lastName"].toString() +
          " " +
          response.data["birthDate"].toString().split('T')[0];
    } catch (ex) {
      print(ex.toString());
      return 'server error...';
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
      return response.data['email'].toString() +
          " " +
          response.data["role"].toString();
    } catch (ex) {
      print(ex.toString());
      return 'server error...';
    }
  }

  Future<List<CardArticleModel>> getArticlesBySectionRequest(
      String section) async {
    var params = {"section": section};
    var URL = baseUrl + 'articles/section/';
    var data = jsonEncode(params);
    logger.i(
        'Trying getArticlesBySection for SECTION = { $section }  on URL = { $URL } DATA = $data');
    try {
      var response = await dio.get(
        URL + section,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        List<CardArticleModel> rez = [];
        Iterable data = json.decode(jsonEncode(response.data));
        return List.from(data.map((e) => CardArticleModel.fromJSON(e)));
      }

      return List.empty();
    } catch (ex) {
      return List.empty();
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

      var response = await dio
          .post(
        url,
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
        data: data,
      )
          .catchError((error, stackTrace) {
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
