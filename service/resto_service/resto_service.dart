//users
//products
//vendors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RestoService {
  static save({
    required String photo,
    required String restoName,
    required String address,
    required double latitude,
    required double longitude,
  }) async {
    await FirebaseFirestore.instance
        .collection("vendors")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "photo": photo,
      "resto_name": restoName,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "owner": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
      }
    });
  }
}
