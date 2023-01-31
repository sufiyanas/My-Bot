import 'dart:convert';
import 'dart:developer';

import 'package:chat_gpt_integration/domain/apikeys.dart';
import 'package:http/http.dart' as https;

Future<List<String>> fetchImagepixels() async {
  List<String> responseList = [];
  final baseURL = Uri.parse("https://api.pexels.com/v1/popular");
  var hedears = {"Authorization": apikeyPexals};

  final response = await https.get(baseURL, headers: hedears);

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    final List allPhotosList = data["photos"];
    for (var image in allPhotosList) {
      final imageSrc = image['src']['original'];
      responseList.add(imageSrc);
    }
    return responseList;
  } else {
    throw Exception("Failed to load data from pexels");
  }
}
