import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Ingresos{
  String fuente;
  DateTime fecha;
  double monto;
  String userId;
  String tipo;

  Ingresos({required this.fuente,required this.fecha,required this.monto,required this.userId,required this.tipo});

  Map <String,dynamic>toJson()=>{
    'fuente':fuente,
    'fecha':fecha,
    'monto':monto,
    'tipo':tipo,
    'userId': userId
  };

  static Ingresos fromJson(Map<String, dynamic> json)=>Ingresos(

      fuente: json['fuente'],
      fecha: (json['fecha'] as Timestamp).toDate(),
      monto: json['monto'],
      tipo: json['tipo'],
      userId: json['userId']
  );

}