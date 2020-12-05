import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sisAcomp/models/matter.dart';

class MatterManager  extends ChangeNotifier{

  MatterManager(){
    _loadAllMatter();
  }

  final Firestore firestore = Firestore.instance;


  //Lista de Matérias
   List<Matter> allMatters = [];


  
  String _search = '';

  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }

  List<Matter> get filteredMatters {
    final List<Matter> filteredMatters = [];

    if(search.isEmpty){
      filteredMatters.addAll(allMatters);
    } else {
      filteredMatters.addAll(
        allMatters.where(
          (p) => p.name.toLowerCase().contains(search.toLowerCase())
        )
      );
    }

    return filteredMatters;
  }


  Future<void> _loadAllMatter() async {
    final QuerySnapshot snapMatters =
      await firestore.collection('matters').getDocuments();

    allMatters = snapMatters.documents.map(
        (d) => Matter.fromDocument(d)).toList();

    notifyListeners();
  }

} 