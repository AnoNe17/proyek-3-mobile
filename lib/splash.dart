import 'dart:async';

import 'package:flutter/material.dart';
import 'login/login.dart';

import './pages/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        width:
            MediaQuery.of(context).size.width, //agar ukuran sama dengan layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_tk.png',
              width: 300,
              height: 300,
            ),
            Text(
                'SISTEM INFORMASI HASIL BELAJAR ANAK\n\n\nPAUD SOKA INDAH\n\n\n',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
