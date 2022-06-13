import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'background.dart';
import '../services/http.dart';
import '../dashboard/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;
  String _username = '';
  String _password = '';
  final formKey = GlobalKey<FormState>();
  TextEditingController txUsername = new TextEditingController();
  TextEditingController txPass = new TextEditingController();

  // Loading Dialog
  Future<void> _showMyDialog() async {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      blur: 0,
      dialogTransitionType: DialogTransitionType.Bubble,
      title: Text("Title"),
      message: Text("Message"),
      dismissable: false,
    );
    progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blue),
    ));
    progressDialog.setMessage(Text("Mohon Tunggu"));
    progressDialog.setTitle(Text("Sedang Login"));
    progressDialog.show();

    await Future.delayed(Duration(seconds: 5));

    // progressDialog.dismiss();
  }

  // Loading Dialog
  // Future<void> loadingDialog() async {
  //   Future.delayed(Duration(seconds: 10)).showProgressDialog(
  //     context,
  //     title: Text("Sedang Login"),
  //     message: Text("Mohon Tunggu"),
  //   );
  // }

  ceklogin() async {
    setState(() {
      _loading = true;
    });
    if (_loading = true) {
      _showMyDialog();
      try {
        http.Response response = await Http.login(_username, _password);
        // Map responseMap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          setState(() {
            _loading = false;
          });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Dashboard()),
              (route) => false);
        } else {
          setState(() {
            _loading = false;
          });
          Navigator.of(context).pop();
          // Menampilkan Dialog
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Username atau Password Salah !',
            // desc: 'Username atau Password Salah !',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          txUsername.text = "";
          txPass.text = "";
        }
      } catch (e) {}
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.10),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: txUsername,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  showCursor: true,
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Masukan Username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username tidak boleh Kosong";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _username = value;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: txPass,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Masukan Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh Kosong";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      ceklogin();
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color.fromARGB(255, 81, 180, 238),
                          Color.fromARGB(255, 41, 109, 255)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
