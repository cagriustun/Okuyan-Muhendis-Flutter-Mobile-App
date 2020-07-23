import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference omCollection =
      Firestore.instance.collection('okuyanmuhendis');
  Future updateUserData(String sugars, String name, int strength) async {
    return await omCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
