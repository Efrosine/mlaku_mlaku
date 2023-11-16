import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HotelModel {
  // final String id;
  final String imageUrls;
  final String name, location, desc;
  final int star, price;
  final double rating;

  String get getPrice {
    final format = NumberFormat.currency(locale: 'id_ID', decimalDigits: 0);
    return format.format(price);
  }

  HotelModel({
    // required this.id,
    required this.imageUrls,
    required this.name,
    required this.location,
    required this.desc,
    required this.star,
    required this.rating,
    required this.price,
  });

  //from json
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      // id: json['id'],
      imageUrls: json['imageUrl'],
      name: json['name'],
      location: json['location'],
      desc: json['desc'],
      star: json['star'],
      rating: json['rating'].runtimeType is double
          ? json['rating']
          : json['rating'].toDouble(),
      price: json['price'],
    );
  }

  // ceate method from quary document snapshot

  factory HotelModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return HotelModel(
      // id: snapshot.id,
      imageUrls: snapshot['imageUrl'],
      name: snapshot['name'],
      location: snapshot['location'],
      desc: snapshot['desc'],
      star: snapshot['star'],
      rating: snapshot['rating'].runtimeType is double
          ? snapshot['rating']
          : snapshot['rating'].toDouble(),
      price: snapshot['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'imageUrl': imageUrls,
      'name': name,
      'location': location,
      'desc': desc,
      'star': star,
      'rating': rating,
      'price': price,
    };
  }
}
