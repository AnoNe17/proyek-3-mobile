import 'package:flutter/material.dart';
import '../widget/widget_menu.dart';

class NilaiPage extends StatefulWidget {
  const NilaiPage({Key? key}) : super(key: key);

  @override
  State<NilaiPage> createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Nilai Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
