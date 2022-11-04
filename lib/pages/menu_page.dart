import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_et/pages/accounts_page.dart';
import 'package:wall_et/pages/ahorros_page.dart';
import 'package:wall_et/pages/especial_pagos_page.dart';
import 'package:wall_et/pages/pagos_page.dart';

import '../Colors.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? id;
  Future<void> seeData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id=prefs.getString('userId');
    // print("el id del usuario es ${id}");
    // readIngresos();
    // print("accede a funcion de lectura del dato");
    // print(id);
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/saving3.jpg"),
                fit: BoxFit.cover,
                //colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),

          Column(
            children: [
              SizedBox(height: size.height * 0.15,),
              Text("Lay Away",style: TextStyle(fontSize: size.height*0.07,color: color11,fontWeight: FontWeight.bold),),
              SizedBox(height: size.height * 0.15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async{
                      await seeData();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AccountsPage(id)));
                    },
                    child: Container(
                      height: size.width * 0.3,
                      width: size.width * 0.35,
                      //padding: EdgeInsets.only(left: size.height*0.015,right: size.height*0.015),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          color: color8
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Icon(Icons.monetization_on,
                            color: color1,
                            size: size.height * 0.06,),
                          Text("Registra tus \ningresos",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: color1),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await seeData();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PagosPage(id)));
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (_) => BlocProvider.value(value: BlocProvider.of<GeneralBloc>(context),child: ClientesPage(),)));
                    },
                    child: Container(
                      height: size.width * 0.3,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          color: color8
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Icon(Icons.electrical_services_outlined, color: color1,
                            size: size.height * 0.06,),
                          Text("Servicios \nBásicos",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: color1),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async{
                      await seeData();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AhorrosPage(id)));
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => HistoryPage()));
                    },
                    child: Container(
                      height: size.width * 0.3,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          color: color8
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Icon(Icons.savings, color: color1,
                            size: size.height * 0.06,),
                          Text("Ahorros",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: color1),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await seeData();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EspecialPagosPage(id)));
                    },
                    child: Container(
                      height: size.width * 0.3,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          color: color8
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Icon(Icons.payment_rounded, color: color1,
                            size: size.height * 0.06,),
                          Text("Gastos \nAdicionales",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: color1),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: size.width * 0.23,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          color: color1
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Icon(Icons.exit_to_app, color: color2,
                            size: size.height * 0.06,),
                          Text("SALIR", style: TextStyle(
                              fontSize: size.height * 0.02,
                              color: color2),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
