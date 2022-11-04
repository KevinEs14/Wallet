import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_et/models/pagos.dart';
import 'package:wall_et/pages/add_pagos_page.dart';

import '../Colors.dart';

class PagosPage extends StatefulWidget {
  String? _id;


  PagosPage(this._id);

  @override
  _PagosPageState createState() => _PagosPageState(this._id);
}

class _PagosPageState extends State<PagosPage> {
  String? _id;

  _PagosPageState(this._id);

  late List<Pagos>_chartData;

  @override
  void initState(){
    // _chartData=getChartData();
    super.initState();
  }
  Stream<List<Pagos>> readPagos() {
    // seeData();
    return FirebaseFirestore.instance.collection('pagos').where(
        'userId', isEqualTo: _id).snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Pagos.fromJson(doc.data())).toList());
  }

  // Stream<List<Pagos>> readAccount()=>FirebaseFirestore.instance.collection('cuenta').snapshots()
  //     .map((snapshot) => snapshot.docs.map((doc) => Pagos.fromJson(doc.data())).toList());

  // List<Pagos>getChartData(){
  //   final List<Pagos> data = [
  //     Pagos( 'Luz',  '25-10-22',35.0),
  //     Pagos( 'Agua',  '25-10-22',45.0),
  //     Pagos( 'Gas',  '25-10-22',25.0),
  //     Pagos( 'Insumos',  '25-10-22',15.0),
  //     Pagos( 'Matricula',  '25-10-22',350.0),
  //     Pagos( 'Luz',  '25-10-22',35.0),
  //     Pagos( 'Agua',  '25-10-22',45.0)
  //   ];
  //   return data;
  // }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color8,
        elevation: 5,
        title: Text("Tus Pagos",style: TextStyle(fontSize: size.height*0.025,color: color1),),
      ),
      body: StreamBuilder<List<Pagos>>(
        stream: readPagos(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final pagos=snapshot.data!;
            return Container(
              height: size.height,
              child: Column(
                children: [
                  Container(
                    height: size.height*0.80,
                    child: SingleChildScrollView(
                      child: Container(
                        height: size.height*0.80,
                        child: ListView(
                          children: pagos.map(buildPagos).toList(),

                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height*0.06,
                    width: size.width*0.3,
                    margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                    padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: color8,
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPagosPage()));
                          // print("delete");
                          // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent(branchId, categoryId, page, size, _data));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add,color: color1,),
                            SizedBox(width: 5,),
                            Text(
                              "Agregar",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: color1),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            );
          }else if(snapshot.hasError){
            // final accounts=snapshot.data!;
            print(snapshot);
            return Text("Algo salio mal  ${snapshot}");
          }else {return Center(child: CircularProgressIndicator());}
        },

      ),
    );
  }


  Widget buildPagos(Pagos pagos)=>Card(
    color: color1,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: pagos.descripcion=="Luz"?Image.asset(
            "assets/images/electricidad.jpeg",
            height: 120,
            width: 120,
          ):pagos.descripcion=="Agua"?Image.asset(
            "assets/images/agua.jpeg",
            height: 120,
            width: 120,
          ):pagos.descripcion=="Gas"?Image.asset(
            "assets/images/gas.jpeg",
            height: 120,
            width: 120,
          ):pagos.descripcion=="Telefonia Movil"?Image.asset(
            "assets/images/telefono.jpeg",
            height: 120,
            width: 120,
          ):pagos.descripcion=="Internet"?Image.asset(
            "assets/images/internet.jpeg",
            height: 120,
            width: 120,
          ):pagos.descripcion=="Seguros"?Image.asset(
            "assets/images/seguros.jpeg",
            height: 120,
            width: 120,
          ):Image.asset(
            "assets/images/universidad.jpeg",
            height: 120,
            width: 120,
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                "${pagos.descripcion}",
                style: TextStyle(
                    fontSize: 27.0,
                    color: color2),
              ),
              Row(
                children: [
                  Text(
                    "${pagos.monto} ",
                    style: TextStyle(
                        fontSize: 25.0, color: color5),
                  ),
                  Text((pagos.tipo=="Bolivianos")?
                  " Bs":" \$",
                    style: TextStyle(
                        fontSize: 25.0, color: color11),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    ),
  );

}
