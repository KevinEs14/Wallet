import 'package:flutter/material.dart';
import 'package:wall_et/pages/accounts_page.dart';
import 'package:wall_et/pages/ahorros_page.dart';
import 'package:wall_et/pages/pagos_page.dart';

import '../Colors.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
              Text("WALL-ET",style: TextStyle(fontSize: size.height*0.07,color: color11,fontWeight: FontWeight.bold),),
              SizedBox(height: size.height * 0.15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AccountsPage()));
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
                          Icon(Icons.add_shopping_cart,
                            color: color1,
                            size: size.height * 0.06,),
                          Text("Ingresa a tu \nbanco",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: color1),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PagosPage()));
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
                          Icon(Icons.group_add, color: color1,
                            size: size.height * 0.06,),
                          Text("Pagos",
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AhorrosPage()));
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
                          Icon(Icons.history, color: color1,
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
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
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
                          Icon(Icons.library_add, color: color1,
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
