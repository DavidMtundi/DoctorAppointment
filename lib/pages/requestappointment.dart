import 'package:flutter/material.dart';

class RequestAppointment extends StatefulWidget {
  RequestAppointment({Key? key}) : super(key: key);

  @override
  _RequestAppointmentState createState() => _RequestAppointmentState();
}

class _RequestAppointmentState extends State<RequestAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Request Appointment Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Text("Not yet implemented"),
      ),
    );
  }
}
