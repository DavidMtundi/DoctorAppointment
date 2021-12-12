import 'package:badges/badges.dart';
import 'package:doctorappointment/data/json.dart';
import 'package:doctorappointment/pages/doctor_profile_page.dart';
import 'package:doctorappointment/theme/colors.dart';
import 'package:doctorappointment/widgets/avatar_image.dart';
import 'package:doctorappointment/widgets/doctor_box.dart';
import 'package:doctorappointment/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Doctors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info,
              color: Colors.grey,
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
              Row(
                children: [
                  const Expanded(child: CustomTextBox()),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.filter_list_rounded,
                    color: primary,
                    size: 35,
                  ),
                ],
              ),
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
              getDoctorList()
            ])));
  }

  getDoctorList() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) => DoctorBox(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DoctorProfilePage(
                          friendName: doctors[index]['name'].toString(),
                          imageUrl: doctors[index]['image'].toString(),
                          skill: doctors[index]['skill'].toString(),
                        )));
          },
          index: index,
          doctor: doctors[index]),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 2),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}
