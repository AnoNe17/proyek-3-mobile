//mengimport package http yang diambil dari pubspec.yaml
// dan menginisialisasikannya menjadi http
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpData {
  //Null Safety KIRIK harus menggunakan "?" setelah tipe datanya agar bisa null
  String? id, name, job, createdAt, fullname, email, avatar;

  HttpData(
      {this.id,
      this.name,
      this.job,
      this.createdAt,
      this.fullname,
      this.email,
      this.avatar});

  //async agar dapat menggunakan await
  //static agar fungsinya bisa dipakai pada class yang lain
  //Future<data> agar datanya bisa diambil atau dipakai pada class lain dengan menggunakan then
  static Future<HttpData> postData(String name, String job) async {
    // url Api tujuan
    //Khusus url harus menggunakan tipe data Uri
    //Dan dan mengkonvertnya dengan Uri.parse agar terbacaa sebagai string
    Uri url = Uri.parse("https://reqres.in/api/users");

    //JIKA TIDAK ADA RESPONSE ATAU BALIKAN DATA pada API
    //http/post = method http yang digunakan
    //url = url dari API
    //body  parameter dan data yang di kirim
    // http.post(url, body: {"name": name, "job": job});

    //JIKA ADA RESPONSE ATAU BALIKAN DATA PADA API
    //await menunggu datanya diisi dan agar bisa menggunakan body
    //await difungsinya harus ditambahkan async
    var hasilResponse = await http.post(url, body: {"name": name, "job": job});

    //Harus di decode dlu
    var dataResponse = json.decode(hasilResponse.body);

    print(dataResponse);

    //Mengisi constructor dengan data response dengan body nya
    return HttpData(
      id: dataResponse["id"], // Mengisi constructor id dengan data Response id
      name: dataResponse["name"],
      job: dataResponse["job"],
      createdAt: dataResponse["createdAt"],
    );
  }

  //Fungsi untuk GET data
  static Future<HttpData> getData(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);
    //Harus di decode dlu
    var data = json.decode(hasilResponse.body)["data"];

    print(data);
    //Mengisi constructor dengan data response dengan body nya
    return HttpData(
      id: data["id"]
          .toString(), // Mengisi constructor id dengan data Response id
      fullname: data["first_name"] + " " + data["last_name"],
      avatar: data["avatar"],
      email: data["email"],
    );
  }
}
