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
  double sumPagos=0.0;
  double sumIngresos=0.0;
  double sumGastos=0.0;
  _AhorrosPageState(this._id);

  late List<PieData>_chartData;
  @override
  void initState(){
    readPagos();
    super.initState();
  }

  readPagos() async{
    // print("entra funcion");
    // seeData();

    var pagos= await FirebaseFirestore.instance.collection('pagos').where(
        'userId', isEqualTo: _id).get();
    var pagosEsp=await FirebaseFirestore.instance.collection('pagosEsp').where(
        'userId', isEqualTo: _id).get();
    var ingresos=await FirebaseFirestore.instance.collection('ingresos').where(
        'userId', isEqualTo: _id).get();
    for(var pago in pagos.docs){
      sumPagos+=pago.data()['monto'];
    }
    for(var pagoEsp in pagosEsp.docs){
      sumGastos+=pagoEsp.data()['monto'];
    }
    for(var ingreso in ingresos.docs){
      sumIngresos+=ingreso.data()['monto'];
    }
    setState(() {

    });

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
        body: sumPagos<=0&&sumGastos<=0&&sumIngresos<=0?
        Center(
          child: CircularProgressIndicator()
        ):
        Column(children: [
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
                              if(sumIngresos>0){'domain': 'Ahorro', 'measure': double.parse((sumIngresos-sumGastos-sumPagos).toStringAsFixed(2))},
                              if(sumPagos>0){'domain': 'Pagos', 'measure': sumPagos},
                              if(sumGastos>0){'domain': 'Gastos', 'measure': sumGastos},
                              // {'domain': 'Cordova', 'measure': 15},
                            ],
                            fillColor: (pieData, index){
                              switch(pieData['domain']){
                                case 'Ahorro':
                                  return color2;
                                case 'Pagos':
                                  return color3;
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
                            Text("Cantidad ahorrada:",style: TextStyle(fontSize: 20,color: color11,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: size.height*0.01,),
                        Container(

                          width: size.width*0.5,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              color: color2
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text((sumIngresos-sumGastos-sumPagos).toStringAsFixed(2),style: TextStyle(fontSize: 20,color: color1,fontWeight: FontWeight.bold),),
                                  Text(" Bs",style: TextStyle(fontSize: 15,color: color1,fontWeight: FontWeight.bold),)
                                ],
                              )
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20,),
                            Text("Pago de servicios basicos:",style: TextStyle(fontSize: 20,color: color11,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: size.height*0.01,),
                        Container(

                          width: size.width*0.3,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              color: color3
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(sumPagos.toStringAsFixed(2),style: TextStyle(fontSize: 20,color: color1,fontWeight: FontWeight.bold),),
                                  Text(" Bs",style: TextStyle(fontSize: 15,color: color1,fontWeight: FontWeight.bold),)
                                ],
                              )
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20,),
                            Text("Gastos personales:",style: TextStyle(fontSize: 20,color: color11,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: size.height*0.01,),
                        Container(

                          width: size.width*0.3,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              color: color6
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(sumGastos.toStringAsFixed(2),style: TextStyle(fontSize: 20,color: color1,fontWeight: FontWeight.bold),),
                                  Text(" Bs",style: TextStyle(fontSize: 15,color: color1,fontWeight: FontWeight.bold),)
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),

    );
  }
}


class PieData {
  PieData({ required this.xData, required this.yData});
  final String xData;
  final num yData;

}