import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
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

  Future<List<CardArticleModel>> getArticlesBySectionRequest(String section) async {
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
      List<CardArticleModel> rez = [];

      Iterable data = json.decode(jsonEncode(response.data));
      return List.from(data.map((e) => CardArticleModel.fromJSON(e)));
    } catch (ex) {
      print(ex);
      return List.empty();
    }
  }
}
