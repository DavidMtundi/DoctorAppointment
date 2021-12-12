// ignore_for_file: prefer_const_constructors

import 'package:doctorappointment/data/json.dart';
import 'package:doctorappointment/model.dart/message.dart';
import 'package:doctorappointment/widgets/avatar_image.dart';
import 'package:doctorappointment/widgets/chatmessagewidget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Chatscreen extends StatefulWidget {
  Chatscreen(
      {Key? key,
      required this.friendName,
      required this.imageUrl,
      required this.messagesList})
      : super(key: key);
  String friendName;
  String imageUrl;
  List<Message> messagesList;

  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: CustomColors.kPrimaryColor,
              titleSpacing: 0.0,
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CircleAvatar(
                    // ignore: unnecessary_const
                    child: AvatarImage(
                      chatsData[1]["image"].toString(),
                      width: 30,
                      height: 30,
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    widget.friendName,
                    style: const TextStyle(color: CustomColors.kLightColor),
                  )
                ],
              ),
              actions: const [
                Icon(Icons.video_call, color: CustomColors.kLightColor),
                SizedBox(width: 15.0),
                Icon(Icons.call, color: CustomColors.kLightColor),
                SizedBox(width: 15.0),
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messagesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatMessageWidget(messagesList[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.kLightColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.insert_emoticon,
                            color: CustomColors.kIconColor,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  border: InputBorder.none),
                            ),
                          ),
                          Icon(
                            Icons.attach_file,
                            color: CustomColors.kIconColor,
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: CustomColors.kIconColor,
                          ),
                          SizedBox(width: 8.0)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  CircleAvatar(
                    child: Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
