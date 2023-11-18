import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mlaku_mlaku/features/data/model/hotel_model.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getDocHotels() {
    return db.collection('dataHotels').snapshots();
  }

  //create crud method

  Future<void> addData(HotelModel model) async {
    db.collection('dataHotels').add(model.toJson());
  }

  Future<void> updateData(String id, Map<String, dynamic> data) async {
    db.collection('dataHotels').doc(id).update(data);
  }

  Future<void> deleteData(String id) async {
    db.collection('dataHotels').doc(id).delete();
  }
}
