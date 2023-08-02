import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelpers = ApiHelpers._();

  Future<List?> getNewsResponse({String query = 'business'}) async {
    String newsApi =
        "https://newsapi.org/v2/top-headlines?country=us&category=$query&apiKey=4c7dd580aed846a3a848b2b1c02b5d07";
    http.Response response = await http.get(Uri.parse(newsApi));

    if (response.statusCode == 200) {
      var news = jsonDecode(response.body);

      List allNews = news['articles'];

      return allNews;
    }
  }
}
