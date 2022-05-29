import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proyek3_mobile/services/http.dart';
import 'package:proyek3_mobile/services/model_data/profil.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widget/widget_menu.dart';
import '../widget/widget_time.dart';
import '../widget/widget_top_container.dart';
import '../widget/widget_category_card.dart';
import '/models/model_maps.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  Widget _menuDashboard({@required IconData? icon, @required String? nama}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blue, width: 1.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            child: Icon(icon),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nama!,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    // return Scaffold(
    //   backgroundColor: Theme.of(context).accentColor,
    //   appBar: AppBar(
    //     elevation: 0.0,
    //     backgroundColor: Colors.blue,
    //     title: Text(
    //       'Serlamat Datang',
    //       style: TextStyle(fontSize: 20),
    //     ),
    //     centerTitle: true,
    //     leading: MenuWidget(),
    //   ),
    //   body: Container(
    //     child: Container(
    //       height: he,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(40),
    //             topRight: Radius.circular(40),
    //           )),
    //       child: ListView(
    //         // padding: EdgeInsets.only(left: 30, top: 30),
    //         children: [
    //           Container(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 20,
    //               vertical: 30,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Timecall(),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                     top: 20,
    //                   ),
    //                   child: Container(
    //                     height: 300,
    //                     child: GridView.count(
    //                       crossAxisCount: 2,
    //                       crossAxisSpacing: 12,
    //                       mainAxisSpacing: 8,
    //                       childAspectRatio: 1.30,
    //                       children: [
    //                         _menuDashboard(
    //                             icon: Icons.access_alarm,
    //                             nama: 'PROFIL SEKOLAH'),
    //                         _menuDashboard(
    //                             icon: Icons.access_alarm, nama: 'Visi Misi'),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    // double width = MediaQuery.of(context).size.width;
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: Colors.blue,
    //     leading: MenuWidget(),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       children: <Widget>[
    //         TopContainer(
    //           height: 150,
    //           width: width,
    //           child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: <Widget>[
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: 0, vertical: 0.0),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: <Widget>[
    //                       // CircularPercentIndicator(
    //                       //   radius: 90.0,
    //                       //   lineWidth: 5.0,
    //                       //   animation: true,
    //                       //   percent: 0.75,
    //                       //   circularStrokeCap: CircularStrokeCap.round,
    //                       //   progressColor: Colors.red,
    //                       //   backgroundColor: Colors.yellow,
    //                       //   center: CircleAvatar(
    //                       //     backgroundColor: Colors.blue,
    //                       //     radius: 35.0,
    //                       //     backgroundImage: AssetImage(
    //                       //       'assets/images/avatar.png',
    //                       //     ),
    //                       //   ),
    //                       // ),
    //                       Column(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: <Widget>[
    //                           Timecall(),
    //                           SizedBox(
    //                             height: he * 0.05,
    //                           ),
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 )
    //               ]),
    //         ),
    //         Container(
    //           child: Container(
    //             height: he * 0.5,
    //             width: double.infinity,
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(40),
    //                   topRight: Radius.circular(40),
    //                 )),
    //             child: ListView(
    //               // padding: EdgeInsets.only(left: 30, top: 30),
    //               children: [
    //                 Container(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 20,
    //                     vertical: 20,
    //                   ),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(
    //                           top: 20,
    //                         ),
    //                         child: Container(
    //                           height: 300,
    //                           child: GridView.count(
    //                             crossAxisCount: 2,
    //                             crossAxisSpacing: 12,
    //                             mainAxisSpacing: 8,
    //                             childAspectRatio: 1.30,
    //                             children: [
    //                               _menuDashboard(
    //                                   icon: Icons.access_alarm,
    //                                   nama: 'PROFIL SEKOLAH'),
    //                               _menuDashboard(
    //                                   icon: Icons.access_alarm,
    //                                   nama: 'Visi Misi'),
    //                             ],
    //                           ),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: MenuWidget(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 52,
                  //     width: 52,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFFF2BEA1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SELAMAT DATANG",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: Colors.white),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .copyWith(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${profil.nama}",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              color: Colors.yellow),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Apa itu PAUD ?",
                          gambarSrc: "assets/icon/school.png",
                          press: () {
                            AwesomeDialog(
                              context: context,
                              body: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'PAUD',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        '     Pendidikan Anak Usia Dini (PAUD) adalah jenjang pendidikan sebelum jenjang pendidikan dasar yang merupakan suatu upaya pembinaan yang ditujukan bagi anak sejak lahir sampai dengan usia enam tahun yang dilakukan melalui pemberian rangsangan pendidikan untuk membantu pertumbuhan dan perkembangan rohani dan jasmani agar anak memiliki kesiapan dalam memasuki pendidikan lebih lanjut, yang diselenggarakan pada jalur formal, nonformal, dan informal.',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              btnOkOnPress: () {},
                              btnOkIcon: Icons.check_circle,
                              btnOkColor: Colors.blue,
                            ).show();
                          },
                        ),
                        CategoryCard(
                          title: "Tujuan PAUD",
                          gambarSrc: "assets/icon/medal.png",
                          press: () {
                            AwesomeDialog(
                              context: context,
                              body: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'TUJUAN',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        ' - Tujuan utama: untuk membentuk anak Indonesia yang berkualitas, yaitu anak yang tumbuh dan berkembang sesuai dengan tingkat perkembangannya sehingga memiliki kesiapan yang optimal di dalam memasuki pendidikan dasar serta mengarungi kehidupan pada masa dewasa.',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, bottom: 15, right: 15),
                                      child: Text(
                                        ' - Tujuan penyerta: untuk membantu menyiapkan anak mencapai kesiapan belajar (akademik) di sekolah, sehingga dapat mengurangi usia putus sekolah dan mampu bersaing secara sehat di jenjang pendidikan berikutnya.',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              btnOkOnPress: () {},
                              btnOkIcon: Icons.check_circle,
                              btnOkColor: Colors.blue,
                            ).show();
                          },
                        ),
                        CategoryCard(
                          title: "Lokasi",
                          gambarSrc: "assets/icon/map.png",
                          press: () {
                            ModelMaps.openMap(-6.3617821, 108.3658955);
                          },
                        ),
                        CategoryCard(
                          title: "Hubungi",
                          gambarSrc: "assets/icon/phone.png",
                          press: () async {
                            launch('tel:+6287727775550');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
