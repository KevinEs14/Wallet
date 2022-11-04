import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_et/models/accountsData.dart';
import 'package:wall_et/models/ingresos.dart';

import '../Colors.dart';

class AddBankAccountPage extends StatefulWidget {
  @override
  _AddBankAccountPageState createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  TextEditingController _nombre = TextEditingController();
  TextEditingController _monto = TextEditingController();
  TextEditingController _fecha = TextEditingController();
  TextEditingController _userId = TextEditingController();
  String? tipoMoneda;

  final List<String> moneda=["Bolivianos", "Dolares"];
  // db.collection("cities").where("capital", isEqualTo: true).get().then(
  // (res) => print("Successfully completed"),
  // onError: (e) => print("Error completing: $e"),
  // );

  String? id;
  // Future createBankAccount(AccountsData accountsData)async{
  //   //Reference to document
  //   final docUser=FirebaseFirestore.instance.collection('ingresos').doc();
  //   final json=accountsData.toJson();
  //   await docUser.set(json);
  // }
  Future createIngresos(Ingresos ingresos)async{
    //Reference to document
    final docUser=FirebaseFirestore.instance.collection('ingresos').doc();
    final json=ingresos.toJson();
    await docUser.set(json);
  }
  Future<String?> seeData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id=prefs.getString('userId');
    return id;
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
                            controller: _nombre,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(
                                  Icons.business,
                                  size: 30,
                                ),
                              ),
                              hintText: "Fuente del ingreso",
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
                            controller: _monto,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(
                                  Icons.monetization_on,
                                  size: 30,
                                ),
                              ),
                              hintText: "Monto",
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
                      padding:  const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.075,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey[500]!.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: DropdownButton<String>(
                            value: tipoMoneda,
                            // isExpanded: true,
                            items: moneda.map(buildMenuItem).toList(),
                            onChanged: (value)=>setState(() {
                              this.tipoMoneda=value;
                            }),
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
                            onPressed: () async{
                              String? user= await seeData();
                              final addIngreso=Ingresos(
                                  fuente: _nombre.text,
                                  fecha: DateTime.now(),
                                  monto: double.parse(_monto.text),
                                  tipo: tipoMoneda??"Bolivianos",
                                  userId: user??(''));
                              createIngresos(addIngreso);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Agregar",
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
                              Navigator.pop(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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

  DropdownMenuItem<String> buildMenuItem(String item)=>
      DropdownMenuItem(
          value: item,
          child: Text(item, style:TextStyle(
              fontSize: 20,
              height: 1.5))
      );

}
