import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:wall_et/models/accountsData.dart';

import '../Colors.dart';
class AhorrosPage extends StatefulWidget {
  @override
  _AhorrosPageState createState() => _AhorrosPageState();
}

class _AhorrosPageState extends State<AhorrosPage> {
  late List<PieData>_chartData;
  @override
  void initState(){
    _chartData=getChartData();
    super.initState();
  }
  // List<AccountsData> data = [
  //   AccountsData(name: 'Jan', number: 35),
  //   AccountsData(name: 'Feb', number: 28),
  //   AccountsData(name: 'Mar', number: 34),
  //   AccountsData(name: 'Apr', number: 32),
  //   AccountsData(name: 'May', number: 40)
  // ];
  List<PieData>getChartData(){
    final List<PieData> data = [
      PieData(xData: 'Jan', yData: 35),
      PieData(xData: 'Feb', yData: 28),
      PieData(xData: 'Mar', yData: 34),
      PieData(xData: 'Apr', yData: 32),
      PieData(xData: 'May', yData: 40)
    ];
    return data;
  }


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
        body: Column(children: [
          //Initialize the chart widget
          // Center(
          //     child:SfCircularChart(
          //         title: ChartTitle(text: 'Sales by sales person'),
          //         legend: Legend(isVisible: true),
          //         series: <CircularSeries>[
          //           PieSeries<PieData,String>(
          //             dataSource: _chartData,
          //             xValueMapper: (PieData data,_)=> data.xData,
          //             yValueMapper: (PieData data,_)=> data.yData,
          //           )
          //         ]
          //     )
          // )
          SizedBox(height: 10,),
          Center(
            child: Container(
              // color: color3,
              height: size.height*0.4,
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
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              // color: color3,
              height: size.height*0.4,
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
        ])
    );
  }
}


class PieData {
  PieData({ required this.xData, required this.yData});
  final String xData;
  final num yData;

}