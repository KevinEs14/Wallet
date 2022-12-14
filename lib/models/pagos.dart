import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Pagos{

  String descripcion;
  DateTime fecha;
  double monto;
  String userId;
  String tipo;

  Pagos({required this.descripcion,required this.fecha,required this.monto,required this.tipo,required this.userId});

  Map <String,dynamic>toJson()=>{
    'fecha':fecha,
    'monto':monto,
    'descripcion':descripcion,
    'tipo': tipo,
    'userId': userId
  };

  static Pagos fromJson(Map<String, dynamic> json)=>Pagos(
      fecha: (json['fecha'] as Timestamp).toDate(),
      monto: json['monto'],
      descripcion: json['descripcion'],
      tipo: json['tipo'],
      userId: json['userId']
  );

}