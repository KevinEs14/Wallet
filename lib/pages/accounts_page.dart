import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wall_et/models/accountsData.dart';
import 'package:wall_et/models/pagos.dart';
import 'package:wall_et/pages/add_bankaccount_page.dart';

import '../Colors.dart';
class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  late List<Pagos>_chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  List<Pagos> getChartData() {
    final List<Pagos> data = [
      Pagos('Banco de Credito', '25-10-22', 35.0),
      Pagos('Banco Nacional de Bolivia', '25-10-22', 45.0),
      Pagos('Banco Ganadero', '25-10-22', 25.0),
      Pagos('Banco de Credito', '25-10-22', 15.0),
      Pagos('Banco Bisa', '25-10-22', 350.0),
      Pagos('Banco Central de Bolivia', '25-10-22', 35.0),
      Pagos('Banco de Credito', '25-10-22', 45.0)
    ];
    return data;
  }

  Stream<List<AccountsData>> readAccount()=>FirebaseFirestore.instance.collection('cuenta').snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => AccountsData.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color8,
        elevation: 5,
        title: Text("Cuentas",
          style: TextStyle(fontSize: size.height * 0.025, color: color1),),
      ),
      body: StreamBuilder<List<AccountsData>>(
        stream: readAccount(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final accounts=snapshot.data!;
            print(accounts);
            return Container(
              height: size.height,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.80,
                    child: SingleChildScrollView(
                      child: Container(
                        height: size.height * 0.80,
                        child: ListView(
                          children: accounts.map(buildAccount).toList(),
                        ),
                        // child: ListView.builder(
                        //     itemCount: accounts.map(buildAccount).toList().length,
                        //     itemBuilder: (context, index) {
                        //       return Card(
                        //         color: color1,
                        //         elevation: 5.0,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10.0),
                        //         ),
                        //         child: Column(
                        //           children: [
                        //             Text(
                        //               "${_chartData[index].nombre}",
                        //               style: TextStyle(
                        //                   fontSize: 20.0,
                        //                   color: color2),
                        //             ),
                        //             Row(
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 Text(
                        //                   "${_chartData[index].monto}",
                        //                   style: TextStyle(
                        //                       fontSize: 35.0, color: color11),
                        //                 ),
                        //                 SizedBox(width: 10,),
                        //                 Text(
                        //                   "Bs",
                        //                   style: TextStyle(
                        //                       fontSize: 25.0, color: color11),
                        //                 ),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     }
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.4,
                    margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: color8,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBankAccountPage()));
                          // print("delete");
                          // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent(branchId, categoryId, page, size, _data));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: color1,),
                            SizedBox(width: 5,),
                            Text(
                              "Agregar Cuenta",
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
  Widget buildAccount(AccountsData accountsData)=>Card(
    color: color1,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      children: [
        Text(
          "${accountsData.name}",
          style: TextStyle(
              fontSize: 20.0,
              color: color2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${accountsData.monto}",
              style: TextStyle(
                  fontSize: 35.0, color: color11),
            ),
            SizedBox(width: 10,),
            Text(
              "Bs",
              style: TextStyle(
                  fontSize: 25.0, color: color11),
            ),
          ],
        ),
      ],
    ),
  );
}

