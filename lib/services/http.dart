import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyek3_mobile/services/model_data/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseURL = "http://192.168.0.105/api/"; //emulator localhost
const Map<String, String> header = {"Content-Type": "application/json"};

class Http {
  static Future<http.Response> login(String username, String password) async {
    Map data = {
      "username": username,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    try {
      var dataLogin = json.decode(response.body)["user"];

      // print(dataLogin);

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('id_user', dataLogin["id"].toString());

      return response;
    } catch (e) {
      return response;
    }
  }

  static Future<String?> getIdUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('id_user');
  }

  static Future<Profil> getProfil() async {
    String? id_user = await getIdUser();

    Uri url = Uri.parse(baseURL + 'profil');

    Map data = {
      "id": id_user,
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_profil = json.decode(response.body)["data"];
    // print(data_profil);
    return Profil(
      id: data_profil["id"].toString(),
      nama: data_profil["nama"],
      nama_panggilan: data_profil["nama_panggilan"],
      no_induk: data_profil["no_induk"],
      tanggal_lahir: data_profil["tanggal_lahir"],
      jenis_kelamin: data_profil["jenis_kelamin"],
      agama: data_profil["agama"],
      anak_ke: data_profil["anak_ke"],
      tanggal_diterima: data_profil["tanggal_diterima"],
      nama_wali: data_profil["nama_wali"],
      pekerjaan_wali: data_profil["pekerjaan_wali"],
      no_telp: data_profil["no_telp"],
      alamat: data_profil["alamat"],
      nama_kelompok: data_profil["nama_kelompok"],
      umur_kelompok: data_profil["umur_kelompok"],
    );
  }
}

    // Text("No. Induk : ${profil.no_induk}"),
    // Text("Nama : ${profil.nama}"),
    // Text("Nama Panggilan : ${profil.nama_panggilan}"),
    // Text("Nama Kelompok : ${profil.nama_kelompok}"),
    // Text("Kelompok Umur: ${profil.umur_kelompok}"),
    // Text("Tanggal Lahir : ${profil.tanggal_lahir}"),
    // Text("Jenis Kelamin : ${profil.jenis_kelamin}"),
    // Text("Agama : ${profil.agama}"),
    // Text("Anak Ke : ${profil.anak_ke}"),
    // Text("Tanggal Diterima : ${profil.tanggal_diterima}"),
    // Text("Nama Wali : ${profil.nama_wali}"),
    // Text("Pekerjaan Wali : ${profil.pekerjaan_wali}"),
    // Text("No Telp : ${profil.no_telp}"),
    // Text("Alamat : ${profil.alamat}"),
