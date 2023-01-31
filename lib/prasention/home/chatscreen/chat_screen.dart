import 'package:chat_gpt_integration/conts/consts.dart';
import 'package:chat_gpt_integration/domain/chatgpt_modal.dart';
import 'package:chat_gpt_integration/prasention/home/widget/sender_row.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController messageController = TextEditingController();
  final ValueNotifier<int> countNotifier = ValueNotifier<int>(0);
  final List<String> responceList = [];
  final List<String> sendMessageList = [];
  // final Stream <List<String>> chatArray;

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  // Text(
                  //   "Chat Gpt here!",
                  //   style: GoogleFonts.cabin(),
                  // ),
                  Expanded(
                    child: ValueListenableBuilder<int>(
                        valueListenable: countNotifier,
                        builder: (BuildContext context, int count, _) {
                          return ListView.builder(
                              itemCount: responceList.length,
                              itemBuilder: (context, index) {
                                // countNotifier.value++;
                                return ListView(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  children: [
                                    SenderRowWidger(
                                      mWidth: mWidth,
                                      text: sendMessageList[index],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ReciverRowWiget(
                                        mWidth: mWidth,
                                        text: responceList[index],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        })

                    //

                    // Text("12:13 Am"),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [ReciverRowWiget(mWidth: mWidth)],
                    // ),
                    // Text("12:13 Am"),

                    //
                    ,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomTextFormField(
                messageController: messageController,
                sendMessageList: sendMessageList,
                responceList: responceList,
                countNotifier: countNotifier,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.messageController,
    required this.sendMessageList,
    required this.responceList,
    required this.countNotifier,
  }) : super(key: key);

  final TextEditingController messageController;
  final List<String> sendMessageList;
  final List<String> responceList;
  final ValueNotifier<int> countNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: messageController,
        cursorColor: kblue,
        cursorRadius: const Radius.circular(10),
        decoration: InputDecoration(
            filled: true,
            fillColor: kblue,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            border: const OutlineInputBorder(),
            hoverColor: kblue,
            focusColor: kblue,
            labelText: "Say any thing!!",
            suffixIcon: IconButton(
                onPressed: () async {
                  String prompt = messageController.text.trim();
                  messageController.clear();
                  sendMessageList.add(prompt);
                  countNotifier.value++;
                  countNotifier.notifyListeners();
                  String generatedText = await generateText(prompt);
                  responceList.add(generatedText);
                  countNotifier.value++;
                  countNotifier.notifyListeners();
                },
                icon: const Icon(Icons.send))),
      ),
    );
  }
}

class ReciverRowWiget extends StatelessWidget {
  const ReciverRowWiget({
    Key? key,
    required this.mWidth,
    required this.text,
  }) : super(key: key);
  final double mWidth;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: mWidth * 0.70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(156, 20, 33, 50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  wordSpacing: 0.8,
                ),
              ),
            )),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
