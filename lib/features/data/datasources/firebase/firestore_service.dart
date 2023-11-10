import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mlaku_mlaku/features/data/model/hotel_model.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  Future<List<HotelModel>> getAllData() async {
    return db.collection('dataHotels').get().then((value) {
      final List<HotelModel> hasil = [];
      for (var element in value.docs) {
        print('ha');
        hasil.add(HotelModel.fromJson(element.data()));
      }
      print('length ${hasil.length}');
      return hasil;
    }, onError: (e) {
      return [];
    });
  }
}
