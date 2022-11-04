import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_et/models/accountsData.dart';
import 'package:wall_et/models/ingresos.dart';
import 'package:wall_et/models/pagos.dart';

import '../Colors.dart';

class AddSpecialPagosPage extends StatefulWidget {
  @override
  _AddSpecialPagosPageState createState() => _AddSpecialPagosPageState();
}

class _AddSpecialPagosPageState extends State<AddSpecialPagosPage> {

  TextEditingController _monto = TextEditingController();
  TextEditingController _nombre = TextEditingController();
  String? tipoMoneda;


  final List<String> moneda=["Bolivianos", "Dolares"];

  String? id;
  Future createPagos(Pagos pagos)async{
    //Reference to document
    final docUser=FirebaseFirestore.instance.collection('pagosEsp').doc();
    final json=pagos.toJson();
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
                              hintText: "Fuente del gasto",
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
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
                              final addPago=Pagos(
                                  descripcion: _nombre.text,
                                  fecha: DateTime.now(),
                                  monto: double.parse(_monto.text),
                                  tipo: tipoMoneda??"Bolivianos",
                                  userId: user??(''));
                              createPagos(addPago);
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
