import 'dart:convert';

import 'package:gifs_search_app/app/http/http_client.dart';
import 'package:http/http.dart' as http;

class GifsRepository {
  GifsRepository({this.search, this.offset = 0});

  String? search;
  int offset;

  Future<Map<String, dynamic>> getGifs() async {
    final httpClient = HttpCLient();

    http.Response response;

    if (search == null) {
      response = await httpClient.get(
          url:
              "https://api.giphy.com/v1/gifs/trending?api_key=M5aofUBX7sU5uRE78ObQHC5AxojGorMg&limit=20&offset=0&rating=g&bundle=messaging_non_clips");
    } else {
      response = await httpClient.get(
          url:
              "https://api.giphy.com/v1/gifs/search?api_key=M5aofUBX7sU5uRE78ObQHC5AxojGorMg&q=$search&limit=20&offset=$offset&rating=g&lang=en&bundle=messaging_non_clips");
    }

    return json.decode(response.body);
  }
}
