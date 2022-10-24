//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class AuthRepository{
//   int _response=0;
//   int get response => _response;
//   set response(int value){
//     _response=value;
//   }
//
//   Future<void>getAccount(String account, String password)async{
//     print("entra funcion");
//     try {
//       // print(account);
//       // print(password);
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: account,
//           password: password
//       );
//       print(userCredential);
//       response=1;
//     } catch(e){
//       print(e);
//       response=0;
//     }
//   }
//   Future<void> verifyAccount()async{
//
//     try{
//       await Firebase.initializeApp();
//       if(FirebaseAuth.instance.currentUser!=null){
//         response=1;
//       }else{
//         response=0;
//       }
//
//     }catch(e){
//       print(e);
//       response=0;
//     }
//   }
//
//   Future<void>signOutAccount()async{
//
//     try{
//       await FirebaseAuth.instance.signOut();
//       response=0;
//     }catch(e){
//       print(e);
//     }
//
//   }
//
// }