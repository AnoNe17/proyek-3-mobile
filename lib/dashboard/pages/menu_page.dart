import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../models/menu_item.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../login/login.dart';

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const nilai = MenuItem('Nilai', Icons.library_books);
  static const profil = MenuItem('Profil', Icons.person);
  static const about = MenuItem('About', Icons.star);

  static const allMenu = <MenuItem>[home, nilai, profil, about];
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuPage(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Button Back
            // Container(
            //   margin: EdgeInsets.only(top: he * 0.03, left: we * 0.38),
            //   width: 40,
            //   height: 40,
            //   alignment: Alignment.center,
            //   decoration: const BoxDecoration(
            //       color: Colors.grey, shape: BoxShape.circle),
            //   child: Container(
            //       width: 47,
            //       height: 47,
            //       alignment: Alignment.center,
            //       decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Color(0xFF04123F),
            //       ),
            //       child: IconButton(
            //           onPressed: () {
            //             ZoomDrawer.of(context)!.close();
            //           },
            //           icon: const Icon(
            //             Icons.arrow_back_ios_outlined,sd
            //             color: Colors.white,
            //             size: 20,
            //           ))),
            // ),
            //Gambar Logo
            SizedBox(
                width: 160,
                height: 160,
                child: Image.asset('assets/logo_tk.png')),
            Container(
              margin: EdgeInsets.only(left: we * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PAUD",
                    style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "SOKA INDAH",
                    style: TextStyle(
                        fontSize: 23,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: he * 0.03,
            ),
            ...MenuItems.allMenu.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: we * 0.08),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white, width: 2),
                  primary: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                label: Text('Logout'),
                icon: Icon(Icons.logout),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    buttonsBorderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'LOGOUT',
                    desc: 'Apakah Anda Yakin ?',
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ).show();
                },
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        )),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        selectedTileColor: Colors.black26,
        selected: currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: () => onSelectedItem(item),
      );
}
