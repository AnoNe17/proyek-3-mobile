import 'package:flutter/material.dart';
import 'package:proyek3_mobile/services/http.dart';
import 'package:proyek3_mobile/services/model_data/penilaian.dart';

class PenilaianPage extends StatefulWidget {
  final String? tema, sub_tema;
  final int? minggu_ke;

  PenilaianPage({this.tema, this.sub_tema, this.minggu_ke});

  @override
  State<PenilaianPage> createState() => _PenilaianPageState();
}

class _PenilaianPageState extends State<PenilaianPage> {
  List<Penilaian> listPenilaian = [];
  Http http = Http();

  getDataPenilaian() async {
    listPenilaian = await http.getNilai(1, widget.minggu_ke);
    setState(() {});
  }

  @override
  void initState() {
    // http.getSemester_1();
    getDataPenilaian();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text(
          "Minggu Ke - " + widget.minggu_ke.toString(),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.warning,
                color: Colors.yellow,
                size: 30,
              ))
        ],
      ),
      floatingActionButton: Container(
        width: 50,
        height: 0,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          fillColor: Colors.blue,
          elevation: 0.0,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  // Here the height of the container is 45% of our total height
                  height: size.height * .13,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tema : " + widget.tema.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Sub Tema : " + widget.sub_tema.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.yellow),
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listPenilaian.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Lingkup Penilaian :",
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.cyan
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${listPenilaian[index].nama_lingkup.toString()}",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ],
                    ),
                    children: [
                      _card(
                        "${listPenilaian[index].kd_indikator}",
                        "${listPenilaian[index].indikator}",
                        "${listPenilaian[index].nilai_ceklis}",
                        "${listPenilaian[index].nilai_anekdot}",
                        "${listPenilaian[index].nilai_hasil_karya}",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _card(String kd_indikator, String indikator, String nilai_ceklis,
      String nilai_anekdot, String nilai_hasil_karya) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 0.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: DataTable(columns: [
                  DataColumn(label: Text("Kompetensi Dasar")),
                  DataColumn(label: Text("Indikator"))
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text(kd_indikator)),
                    DataCell(Text(indikator)),
                  ]),
                ]),
              ),
              Center(
                child: DataTable(columns: [
                  DataColumn(label: Text("Ceklis")),
                  DataColumn(label: Text("Anekdot")),
                  DataColumn(label: Text("Hasil Karya")),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text(nilai_ceklis)),
                    DataCell(Text(nilai_anekdot)),
                    DataCell(Text(nilai_hasil_karya)),
                  ]),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
