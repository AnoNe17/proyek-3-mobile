import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '/dashboard/pages/about_page.dart';
import '../dashboard/pages/profil_page.dart';
import '../models/menu_item.dart';
import 'pages/menu_page.dart';
import 'pages/nilai_page.dart.dart';
import 'pages/home_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:side_navigation/nilai_page.dart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  MenuItem currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        borderRadius: 40.0,
        slideWidth: MediaQuery.of(context).size.width * 0.35,
        angle: -10.0,
        showShadow: true,
        backgroundColor: Colors.orangeAccent,
        style: DrawerStyle.DefaultStyle,
        mainScreen: getScreen(),
        menuScreen: Builder(
          builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });

              ZoomDrawer.of(context)!.close();
            },
          ),
        ),
      );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.nilai:
        return const NilaiPage();
      case MenuItems.profil:
        return const ProfilPage();
      case MenuItems.about:
        return const AboutPage();
      default:
        return const HomePage();
    }
  }
}
