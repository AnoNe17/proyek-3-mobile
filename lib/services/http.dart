import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyek3_mobile/services/model_data/penilaian.dart';
import 'package:proyek3_mobile/services/model_data/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model_data/mingguan.dart';

const String baseURL = "http://192.168.0.105/api/"; //emulator localhost
const Map<String, String> header = {"Content-Type": "application/json"};

class Http {
  static Future<String?> getIdUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('id_user');
  }

  static Future<String?> getIdSiswa() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('id_siswa');
  }

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
      // pref.setString('id_siswa', dataLogin["id_user"].toString());

      return response;
    } catch (e) {
      return response;
    }
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

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id_siswa', data_profil["id"].toString());

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

  Future getMingguan(int semester) async {
    var url = Uri.parse(baseURL + 'penilaian/semester_1');
    String? id_siswa = await getIdSiswa();
    int? smt = semester;

    // print(id_siswa);

    Map data = {"id_siswa": id_siswa, "semester": smt};
    var body = json.encode(data);
    try {
      // final response = await http.post(url);
      http.Response response = await http.post(
        url,
        headers: header,
        body: body,
      );
      print(response.body);

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);

        List<Mingguan> mingguan = it.map((e) => Mingguan.fromJson(e)).toList();

        // print(response.body);

        return mingguan;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getNilai(int semester, int? minggu_ke) async {
    var url = Uri.parse(baseURL + 'penilaian/semester_1/nilai');
    String? id_siswa = await getIdSiswa();
    int smt = semester;
    int? minggu = minggu_ke;

    // print(id_siswa);

    Map data = {"id_siswa": id_siswa, "semester": smt, "minggu_ke": minggu};
    var body = json.encode(data);
    try {
      // final response = await http.post(url);
      http.Response response = await http.post(
        url,
        headers: header,
        body: body,
      );
      print(response.body);

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);

        List<Penilaian> penilaian =
            it.map((e) => Penilaian.fromJson(e)).toList();

        // print(response.body);

        return penilaian;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
