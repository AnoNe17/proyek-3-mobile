import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:math';
import '/models/http_data.dart';

class getData extends StatefulWidget {
  const getData({Key? key}) : super(key: key);

  @override
  _getDataState createState() => _getDataState();
}

class _getDataState extends State<getData> {
  HttpData dataResponse = HttpData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  //Jika id pada dataResponse kosong (null)
                  (dataResponse.id == null)
                      ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                      //Jika data tidak kosong
                      : "${dataResponse.avatar}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                //Jika id pada dataResponse kosong (null)
                (dataResponse.id == null)
                    ? "ID : Durung ana data"
                    //Jika data tidak kosong
                    : "ID : ${dataResponse.id}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                //Jika id pada dataResponse kosong (null)
                (dataResponse.id == null)
                    ? "Aran Full : Durung ana data"
                    //Jika data tidak kosong
                    : "Aran Full : ${dataResponse.fullname}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                //Jika id pada dataResponse kosong (null)
                (dataResponse.email == null)
                    ? "Durung ana Email"
                    //Jika data tidak kosong
                    : "${dataResponse.email}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                //Agar id yang di get dapat di random atau secara acak
                HttpData.getData((1 + Random().nextInt(10)).toString())
                    .then((value) {
                  print(value.fullname);

                  setState(() {
                    dataResponse = value;
                  });
                });
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
