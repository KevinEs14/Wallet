import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_et/pages/create_account_page.dart';
import 'package:wall_et/pages/menu_page.dart';
// import 'package:wall_et/repository/login_repository.dart';

import '../Colors.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String? id;

  //Login Function
  static Future<User?>loginUsingEmailPassword({required String email, required String password, required BuildContext context})async{
    // final prefs = await SharedPreferences.getInstance();
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

      // await prefs.setString('action', user?.uid??(''));
      // print(prefs.getString('action'));
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        print("No existe el usuario");
      }
    }
    return user;
  }
  Future<void>saveUserId(String userId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    // print(prefs.getString('userId'));
  }
  Future<void> seeData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id=prefs.getString('userId');
    // print("accede a funcion de lectura del dato");
    // print(id);
  }

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
                image: AssetImage("assets/images/saving2.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                  child: Center(
                    // child: Container(
                        // width: size.width*0.8,
                        child: Text("Wall-et",
                                style: TextStyle(color: color1, fontSize: 60,fontWeight: FontWeight.bold),
                        ),
                        // child: Image(
                        //   image: AssetImage('assets/images/logoItecsa2.png'),
                        // )
                    // ),

                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: size.height * 0.075,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _username,
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
                        hintText: "Nombre de Usuario",
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.025, height: 1.5),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: size.height * 0.075,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(0.5),
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
                            FontAwesomeIcons.lock,
                            size: 30,
                          ),
                        ),
                        hintText: "Contraseña",
                        // hintStyle: kBodyText,
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                height: size.height * 0.075,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.0), color: color8),
                child: FlatButton(
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(email: _username.text, password: _password.text, context: context);
                    print(user);

                    if(user!= null){
                      await saveUserId(user.uid);
                      await seeData();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MenuPage()));
                    }

                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
                  },
                  child: Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                        color: color1,
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountPage()));
                },
                child: Text(
                  "Registrar cuenta",
                  style: TextStyle(
                      color: color2,
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

