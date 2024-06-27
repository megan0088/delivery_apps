//users
//products
//vendors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static save({
    required String photo,
    required String name,
    required String email,
    required String role,
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "name": name,
      "photo": photo,
      // "email": email,
    });
  }
}
