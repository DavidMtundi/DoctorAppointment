import 'package:badges/badges.dart';
import 'package:doctorappointment/data/json.dart';
import 'package:doctorappointment/theme/colors.dart';
import 'package:doctorappointment/widgets/category_box.dart';
import 'package:doctorappointment/widgets/popular_doctor.dart';
import 'package:doctorappointment/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Badge(
              position: BadgePosition.topEnd(top: 7, end: -4),
              badgeContent: const Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(
                Icons.notifications_sharp,
                color: primary,
              ),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: const Text(
              "Hi Patient,",
              style: TextStyle(
                  fontSize: 23, color: primary, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              child: const Text(
            "Please select an option",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
          const SizedBox(
            height: 15,
          ),
          const CustomTextBox(),
          const SizedBox(
            height: 25,
          ),
          Container(
              child: const Text(
            "Options",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryBox(
                  title: "Regular Visit",
                  icon: Icons.favorite,
                  color: Colors.red,
                ),
                CategoryBox(
                  title: "Antenatal",
                  icon: Icons.local_hospital,
                  color: Colors.blue,
                ),
                CategoryBox(
                  title: "Postnatal",
                  icon: Icons.details_rounded,
                  color: Colors.purple,
                ),
                // CategoryBox(title: "Healing", icon: Icons.healing_outlined, color: Colors.green, ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/vectors/electronic-health-record-concept-vector-id1299616187?k=20&m=1299616187&s=612x612&w=0&h=gmUf6TXc8w6NynKB_4p2TzL5PVIztg9UK6TOoY5ckMM="),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
              child: const Text(
            "Popular Doctors",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularDoctor(
                  doctor: doctors[0],
                ),
                PopularDoctor(
                  doctor: doctors[1],
                ),
                PopularDoctor(
                  doctor: doctors[2],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
