import 'dart:developer';
import 'package:chat_gpt_integration/conts/consts.dart';
import 'package:chat_gpt_integration/domain/image_modal.dart';
import 'package:chat_gpt_integration/domain/pexals_modal.dart';
import 'package:chat_gpt_integration/prasention/home/Imagescreen/image_view_screen.dart';
import 'package:flutter/material.dart';

class ImadeScreen extends StatefulWidget {
  ImadeScreen({super.key});

  @override
  State<ImadeScreen> createState() => _ImadeScreenState();
}

class _ImadeScreenState extends State<ImadeScreen> {
  final TextEditingController controller = TextEditingController();
  String? dropdownvalue;
  String image = " ";
  List<String> allphotos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fertchdatafunction();
    log(allphotos.toString());
  }

  fertchdatafunction() async {
    List<String> allPhotoList = await fetchImagepixels();
    for (var image in allPhotoList) {
      allphotos.add(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            cursorColor: kblue,
                            cursorRadius: const Radius.circular(10),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: kblue,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              border: InputBorder.none,
                              hoverColor: kblue,
                              focusColor: kblue,
                              hintText: "Say any thing!!",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (controller.text.isNotEmpty) {
                          log("function called");
                          final String imageURl = await Apisample.getimage(
                              context: context,
                              textPrompt: controller.text.trim());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewScreen(
                                  imageURL: imageURl,
                                ),
                              ));

                          // setState(() {
                          //   image = imageURl;
                          // });
                          controller.clear();
                        } else {
                          log("method called");
                          log("no data please add some data");
                          return;
                        }
                      },
                      child: const Text("Click here to Genarate"))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(allphotos.length, (index) {
                return Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      allphotos[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
