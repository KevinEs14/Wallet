import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wall_et/models/accountsData.dart';
import 'package:d_chart/d_chart.dart';
import 'package:wall_et/models/pagos.dart';

import '../Colors.dart';
class AhorrosPage extends StatefulWidget {
  String? _id;

  AhorrosPage(this._id);

  @override
  _AhorrosPageState createState() => _AhorrosPageState(this._id);
}

class _AhorrosPageState extends State<AhorrosPage> {
  String? _id;
  double pagos=0.0;
  double ahorro=0.0;
  double gastos=0.0;
  _AhorrosPageState(this._id);

  late List<PieData>_chartData;
  @override
  void initState(){
    readPagos();
    super.initState();
  }

  Stream<List<Pagos>> readPagos() {
    // print("entra funcion");
    // seeData();
    return FirebaseFirestore.instance.collection('pagos').where(
        'userId', isEqualTo: _id).snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
           return Pagos.fromJson(doc.data());
        }
        ).toList());

  }
  Stream<List<Pagos>> readEspPagos() {
    // print("entra funcion");
    // seeData();
    return FirebaseFirestore.instance.collection('pagosEsp').where(
        'userId', isEqualTo: _id).snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          return Pagos.fromJson(doc.data());
        }
        ).toList());

  }
  // Future<void> countPagos(){
  //   List<Pagos> newList=readPagos();
  // }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color13,
      appBar: AppBar(
        backgroundColor: color8,
        elevation: 5,
        title: Text("Tus Ahorros",style: TextStyle(fontSize: size.height*0.025,color: color1),),
      ),
        body: StreamBuilder<List<Pagos>>(
          stream: readPagos(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              final pagos=snapshot.data!;
              print(pagos[0].monto);
              return Column(children: [
                //Initialize the chart widget
                SizedBox(height: 10,),
                Center(
                  child: Container(
                    // color: color3,
                    height: size.height*0.45,
                    width: size.width*0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        color: color1
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20,),
                            Text("Grafico",style: TextStyle(fontSize: 20,color: color11,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(
                          height: size.height*0.35,
                          width: size.width*0.9,
                          child: DChartPie(
                            data: [
                              {'domain': 'Ahorro', 'measure': 28},
                              {'domain': 'Pagos', 'measure': 27},
                              {'domain': 'Gastos', 'measure': 20},
                              // {'domain': 'Cordova', 'measure': 15},
                            ],
                            fillColor: (pieData, index){
                              switch(pieData['domain']){
                                case 'Ahorro':
                                  return color3;
                                case 'Pagos':
                                  return color2;
                                case 'Gastos':
                                  return color6;
                              }
                            },
                            labelColor: Colors.white,
                            labelFontSize: 16,
                            pieLabel: (Map<dynamic,dynamic>pieData,int? index){
                              return pieData['domain']+":\n"+pieData['measure'].toString()+' Bs';
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    // color: color3,
                    height: size.height*0.38,
                    width: size.width*0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        color: color1
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20,),
                            Text("Cantidad para ahorrar",style: TextStyle(fontSize: 20,color: color11,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: size.height*0.1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(

                              width: size.width*0.5,
                              height: size.height*0.07,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color: color2
                              ),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("760.00 ",style: TextStyle(fontSize: 20,color: color1,fontWeight: FontWeight.bold),),
                                      Text(" Bs",style: TextStyle(fontSize: 15,color: color1,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                            ),
                            Container(

                              width: size.width*0.3,
                              height: size.height*0.07,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color: color3
                              ),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("240.00 ",style: TextStyle(fontSize: 20,color: color1,fontWeight: FontWeight.bold),),
                                      Text(" Bs",style: TextStyle(fontSize: 15,color: color1,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
            }else {return Center(child: CircularProgressIndicator());}
          },
        )
    );
  }
}


class PieData {
  PieData({ required this.xData, required this.yData});
  final String xData;
  final num yData;

}