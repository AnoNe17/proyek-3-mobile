import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '/models/http_data.dart';

class postData extends StatefulWidget {
  const postData({Key? key}) : super(key: key);

  @override
  _postDataState createState() => _postDataState();
}

class _postDataState extends State<postData> {
  //Mengambil data pada class HttpData
  // Kemudian menginisialisasskian menjadi dataResponse
  HttpData dataResponse = HttpData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("POST - METHOD")),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                "Mengambil API dari\n'https://reqres.in/api/users'\nMethod POST with RESPONSE",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
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
                //Jika name pada dataResponse kosong (null)
                (dataResponse.id == null)
                    //output
                    ? "Durung ana Nama"
                    //Jika data tidak kosong
                    : "${dataResponse.name}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                //Jika Job pada dataResponse kosong (null)
                (dataResponse.job == null)
                    ? "Durung ana Job"
                    //Jika data tidak kosong
                    : "ID : ${dataResponse.job}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                //Jika createdAt pada dataResponse kosong (null)
                (dataResponse.id == null)
                    ? "Durung ana data"
                    //Jika data tidak kosong
                    : "ID : ${dataResponse.createdAt}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                //Memanggil fungsi postData oada class httpData dengan parameter data
                //sebelum menggunakan .then tipe fungsi pada postData harus future
                // .then untuk mengambil data return pada fungsi postData
                // value = datanya
                HttpData.postData("Lana", "Anu").then(
                  //gunakan print(value agar di cek ada atau tidak datanya)
                  //melihatnya pada debug console
                  (value) {
                    print(value.name);

                    //setState Merefresh ulang code dari atas ke bawah
                    //mengisi dataResponse dengan value
                    setState(() {
                      dataResponse = value;
                    });
                  },
                );
              },
              child: Text(
                "POST DATA",
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
