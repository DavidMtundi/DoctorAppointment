import 'package:doctorappointment/data/json.dart';
import 'package:doctorappointment/model.dart/message.dart';
import 'package:doctorappointment/pages/chatscreen.dart';
import 'package:doctorappointment/pages/requestappointment.dart';
import 'package:doctorappointment/theme/colors.dart';
import 'package:doctorappointment/widgets/avatar_image.dart';
import 'package:doctorappointment/widgets/contact_box.dart';
import 'package:doctorappointment/widgets/doctor_info_box.dart';
import 'package:doctorappointment/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  DoctorProfilePage({
    Key? key,
    required this.friendName,
    required this.imageUrl,
    required this.skill,
  }) : super(key: key);
  String friendName;
  String imageUrl;
  String skill;

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Doctor's Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: getBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: MyButton(
            disableButton: false,
            bgColor: primary,
            title: "Request For Appointment",
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (_) => RequestAppointment());
              Navigator.push(context, route);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Patient time 8:00am - 5:00pm",
              style: TextStyle(fontSize: 13, color: Colors.green)),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Description",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    "This is a very experienced doctor with more than 5 years of experience in this field",
                    style: TextStyle(fontSize: 13, color: Colors.black54)),
                const SizedBox(
                  height: 25,
                ),
                const Text("Price",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 5,
                ),
                const Text("kshs 100  per hour",
                    style: TextStyle(fontSize: 13, color: Colors.black54)),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.friendName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.skill.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              AvatarImage(
                widget.imageUrl.toString(),
                radius: 10,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.orangeAccent,
              ),
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.orangeAccent,
              ),
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.orangeAccent,
              ),
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 18,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text("4.0 Out of 5.0",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "340 Patients review",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactBox(
                icon: Icons.videocam_rounded,
                color: Colors.blue,
                onTap: () {},
              ),
              ContactBox(
                icon: Icons.call_end,
                color: Colors.green,
                onTap: () {},
              ),
              ContactBox(
                icon: Icons.chat_rounded,
                color: Colors.purple,
                onTap: () {
                  try {
                    Route route = MaterialPageRoute(
                        builder: (_) => Chatscreen(
                            friendName: widget.friendName,
                            imageUrl: widget.imageUrl,
                            messagesList: messagesList));
                    // Navigator.pop(context);
                    ///xx                                                                                                                                                                                                                                                                                                                                                  x x x xxxxxxxxxx Navigator.push(context, route);
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoctorInfoBox(
                value: "500+",
                info: "Successful Patients",
                icon: Icons.groups_rounded,
                color: Colors.green,
              ),
              DoctorInfoBox(
                value: "10 Years",
                info: "Experience",
                icon: Icons.medical_services_rounded,
                color: Colors.purple,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoctorInfoBox(
                value: "28+",
                info: "Successful OT",
                icon: Icons.bloodtype_rounded,
                color: Colors.blue,
              ),
              DoctorInfoBox(
                value: "8+",
                info: "Certificates Achieved",
                icon: Icons.card_membership_rounded,
                color: Colors.orange,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
