import 'package:flutter/material.dart';

class Timecall extends StatelessWidget {
  String text = "";
  String waktu = "";
  int nowtime = DateTime.now().hour;
  String time_call() {
    if (nowtime <= 11) {
      waktu = "☀️";
    }
    if (nowtime > 11) {
      waktu = "🌞";
    }
    if (nowtime >= 16) {
      waktu = "🌆";
    }
    if (nowtime >= 18) {
      waktu = "🌙";
    }
    text = "Selamat Datang " + waktu;

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      time_call(),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ),
    ));
  }
}
