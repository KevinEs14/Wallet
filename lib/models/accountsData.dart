import 'package:cloud_firestore/cloud_firestore.dart';

class AccountsData{
  String id;
  final String name;
  final DateTime fecha;
  final double monto;
  final String tipo;
  final String userId;

  AccountsData({this.id='', required this.name,required this.tipo,required this.fecha,required this.monto,required this.userId});

  Map <String,dynamic>toJson()=>{
    'nombre':name,
    'fecha':fecha,
    'monto':monto,
    'tipo':tipo,
    'userId': userId
  };

  static AccountsData fromJson(Map<String, dynamic> json)=>AccountsData(

      name: json['nombre'],
      fecha: (json['fecha'] as Timestamp).toDate(),
      monto: json['monto'],
      tipo: json['tipo'],
      userId: json['userId']
  );

}