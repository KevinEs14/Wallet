import 'package:flutter/material.dart';
import 'package:wall_et/models/user.dart';
import 'package:wall_et/pages/login_page.dart';

import '../Colors.dart';
import 'menu_page.dart';
class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cellphone = TextEditingController();
  // late User _user;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/saving3.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _firstName,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.perm_contact_cal_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Nombre",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.025,
                                        height: 1.5),
                                  ),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _lastName,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.perm_contact_cal_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Apellido",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.025,
                                        height: 1.5),
                                  ),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.email_rounded,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Email",
                                    // hintStyle: kBodyText,
                                  ),
                                  // obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _password,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.lock,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Contraseña",
                                    // hintStyle: kBodyText,
                                  ),
                                  obscureText: true,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _cellphone,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.phone,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Celular",
                                    // hintStyle: kBodyText,
                                  ),
                                  // obscureText: true,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.height * 0.06,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: color8),
                                child: FlatButton(
                                  onPressed: () {
                                    // _user.userId=1;
                                    // _user.name = _firstName.text;
                                    // _user.lastName = _lastName.text;
                                    // _user.email = _email.text;
                                    // _user.password = _password.text;
                                    // _user.phone = _cellphone.text;
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
                                  },
                                  child: Text(
                                    "Crear",
                                    style: TextStyle(
                                        color: color1,
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              Container(
                                height: size.height * 0.06,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: color3),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  },
                                  child: Text(
                                    "Cancelar",
                                    style: TextStyle(
                                        color: color1,
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )


      ],
    );
  }
}
