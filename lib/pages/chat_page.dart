import 'package:badges/badges.dart';
import 'package:doctorappointment/data/json.dart';
import 'package:doctorappointment/model.dart/message.dart';
import 'package:doctorappointment/pages/chatscreen.dart';
import 'package:doctorappointment/theme/colors.dart';
import 'package:doctorappointment/widgets/avatar_image.dart';
import 'package:doctorappointment/widgets/chat_item.dart';
import 'package:doctorappointment/widgets/textbox.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chat Room",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomTextBox(),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        chatsData.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Badge(
                                  badgeColor: Colors.green,
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  position:
                                      BadgePosition.topEnd(top: -3, end: 0),
                                  badgeContent: const Text(''),
                                  child: AvatarImage(
                                      chatsData[index]["image"].toString())),
                            ))),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 30,
                      child: const Center(
                        child: Text(
                          "Chats",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: Center(
                        child: TextButton(
                          child: const Text(
                            "Video Calls",
                            style: const TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: gotovideo(),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Add New",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.add,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              getChatList()
            ])));
  }

  getChatList() {
    return Column(
        children: List.generate(
            chatsData.length,
            (index) => ChatItem(
                  chatsData[index],
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => Chatscreen(
                            friendName: chatsData[index]["name"].toString(),
                            imageUrl: chatsData[index]["image"].toString(),
                            messagesList: messagesList));
                    Navigator.push(context, route);
                  },
                )));
  }

  gotovideo() {}
}
