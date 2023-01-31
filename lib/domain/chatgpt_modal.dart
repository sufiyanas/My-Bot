import 'dart:developer';

import 'package:chat_gpt_integration/domain/apikeys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String model = "text-davinci-002";

Future<String> generateText(String prompt) async {
  final baseUrl = "https://api.openai.com/v1/engines/$model/completions";
  var url = Uri.parse(baseUrl);
  var body = jsonEncode({"prompt": prompt, "max_tokens": 2500, "stop": "."});
  var response = await http.post(url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKeyAnshad"
      },
      body: body);

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse["choices"][0]["text"];
  } else {
    log("Error on chat ");
    return "error!! ";
  }
}
