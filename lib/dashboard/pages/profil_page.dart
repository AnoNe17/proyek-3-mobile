import 'package:flutter/material.dart';
import 'package:proyek3_mobile/services/http.dart';
import 'package:proyek3_mobile/services/model_data/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/widget_menu.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Profil profil = Profil();

  @override
  initState() {
    super.initState();

    Http.getProfil().then((value) {
      // Add listeners to this class
      setState(() {
        profil = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Halaman Profil"),
        leading: MenuWidget(),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _profileName("${profil.nama}"),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      // _getHeader(),
                      _detailsCard(
                          "No. Induk", "${profil.no_induk}", Icons.account_box),
                      _detailsCard("Nama Panggilan", "${profil.nama_panggilan}",
                          Icons.person),
                      _detailsCard("Nama Kelompok", "${profil.nama_kelompok}",
                          Icons.badge),
                      _detailsCard("Kelompok Umur", "${profil.umur_kelompok}",
                          Icons.ac_unit),
                      _detailsCard("Tanggal Lahir", "${profil.tanggal_lahir}",
                          Icons.calendar_today),
                      _detailsCard("Jenis Kelamin", "${profil.jenis_kelamin}",
                          Icons.accessibility),
                      _detailsCard("Agama", "${profil.agama}", Icons.person),
                      _detailsCard(
                          "Anak Ke", "${profil.anak_ke}", Icons.person),
                      _detailsCard("Tanggal Diterima",
                          "${profil.tanggal_diterima}", Icons.person),
                      _detailsCard(
                          "Nama Wali", "${profil.nama_wali}", Icons.person),
                      _detailsCard("Pekerjaan Wali", "${profil.pekerjaan_wali}",
                          Icons.person),
                      _detailsCard(
                          "No Telp", "${profil.no_telp}", Icons.person),
                      _detailsCard("Alamat", "${profil.alamat}", Icons.person),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green, fontSize: 28, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard(String judul, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    judul,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    value,
                    style: TextStyle(
                      // color: Colors.grey[700],
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
