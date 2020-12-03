import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  User({this.email, this.password, this.name, this.id});

  //Carregando os dados do Usuário direto do Firebase
  User.fromDocument(DocumentSnapshot document){
    id    = document.documentID;
    name  = document.data['name'] as String;
    email = document.data['email'] as String;
  }

  String id;  
  String name;
  String email;
  String password;

  String confirmPassword;

  //Referencia do documento no firebase Cloud
  DocumentReference get firestoreRef =>
    Firestore.instance.document('users/$id');

  //Salva dados no Cloud
  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }


  //Dados do usuário a serem inseridos no Cloud
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
    };
  }
} 