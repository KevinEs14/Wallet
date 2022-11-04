import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_et/models/pagos.dart';
import 'package:wall_et/pages/add_special_pagos_page.dart';

import '../Colors.dart';

class EspecialPagosPage extends StatefulWidget {
  String? _id;


  EspecialPagosPage(this._id);

  @override
  _EspecialPagosPageState createState() => _EspecialPagosPageState(this._id);
}

class _EspecialPagosPageState extends State<EspecialPagosPage> {
  String? _id;

  _EspecialPagosPageState(this._id);

  late List<Pagos>_chartData;

  @override
  void initState(){
    // _chartData=getChartData();
    super.initState();
  }
  Stream<List<Pagos>> readPagos() {
    // seeData();
    return FirebaseFirestore.instance.collection('pagosEsp').where(
        'userId', isEqualTo: _id).snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Pagos.fromJson(doc.data())).toList());
  }

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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSpecialPagosPage()));
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
        // Container(
        //   padding: EdgeInsets.all(10.0),
        //   child: Image.asset(
        //     "assets/images/saving.jpeg",
        //     height: 120,
        //     width: 120,
        //   ),
        // ),
        Container(
          child: Column(
            children: [
              Text(
                "${pagos.descripcion}",
                style: TextStyle(
                    fontSize: 30.0,
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
