import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newslitter/Model/ArticlesModel/articles.dart';
import 'package:newslitter/Model/ArticlesModel/articles_mode.dart';
import 'package:newslitter/Services/Api/api_status.dart';
import 'package:newslitter/Utils/Constant/constants.dart';

class GetData {
  static fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Articles articles = Articles.fromJson(data);
        List<ArticlesModel> articlesList = articles.art
            .map<ArticlesModel>((json) => ArticlesModel.fromJson(json))
            .toList();

        return Sucess(response: articlesList);
      }
      return Failure(code: INVALID_RESPONSE, errorresponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorresponse: 'NO Internet');
    } on FormatException {
      Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKOWN_ERROR, errorresponse: 'Invalid Response');
    }
  }
}
