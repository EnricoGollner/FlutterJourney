import 'dart:convert';

import 'package:gifs_search_app/app/data/http/http_client.dart';
import 'package:gifs_search_app/app/data/models/gif_model.dart';
import 'package:http/http.dart' as http;

class GifsRepository {
  GifsRepository({
    this.search,
    this.offset = 0,
  });

  String? search;
  int offset;

  Future<List<GifModel>> getGifs() async {
    final httpClient = HttpCLient();

    http.Response response;

    if (search == null) {
      response = await httpClient.get(
          url:
              "https://api.giphy.com/v1/gifs/trending?api_key=M5aofUBX7sU5uRE78ObQHC5AxojGorMg&limit=20&offset=0&rating=g&bundle=messaging_non_clips");
    } else {
      response = await httpClient.get(
          url:
              "https://api.giphy.com/v1/gifs/search?api_key=M5aofUBX7sU5uRE78ObQHC5AxojGorMg&q=$search&limit=19&offset=$offset&rating=g&lang=en&bundle=messaging_non_clips");
    }

    final Map<String, dynamic> jsonDecoded = json.decode(response.body);
    final List<dynamic> data = jsonDecoded["data"];
    final List<GifModel> gifList =
        data.map((e) => GifModel.fromMap(e)).toList();

    return gifList;
  }
}
