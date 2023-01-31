import 'dart:convert';
import 'dart:developer';
import 'package:chat_gpt_integration/domain/apikeys.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class ImageApi {
//   static final url = Uri.parse("https://api.openai.com/v1/images/generations");
//   static final headers = {
//     "Content-Type": "application/json",
//     "Authorization": "Bearer $apiKeyImage"
//   };

//   static generateImage({required String text, required String size}) async {
//     var response = await http.post(
//       url,
//       headers: headers,
//       body: jsonEncode({"prompt": text, "n": "1", "size": size}),
//     );

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       log(data);
//       return data;
//     } else {
//       log("failed to fetch the image");
//     }
//   }
// }

class Apisample {
  static getimage(
      {required String textPrompt, required BuildContext context}) async {
    final baseUri = "https://api.openai.com/v1/images/generations";
    var url = Uri.parse(baseUri);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKeyAnshad"
        },
        body: jsonEncode({"model": "image-alpha-001", "prompt": textPrompt}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String imageUrl = data["data"][0]["url"];
      log(imageUrl);
      return imageUrl;
      // Use the imageUrl as needed in your app
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Some Wend wrong"),
            content: Text("hint: check your internetconnection!"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
