import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static String role = "";
  static bool get isAdmin => role == "Admin";
  static bool get isCustomer => role == "Customer";
  static bool get isVendor => role == "Vendor";
  static bool get isDriver => role == "Driver";

// if(AuthService.role=="Admin"){}
// if(AuthService.isAdmin){}
  static Future<bool> saveUserData(String role) async {
    AuthService.role = role;
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (!snapshot.exists) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "photo": FirebaseAuth.instance.currentUser!.photoURL,
        "email": FirebaseAuth.instance.currentUser!.email,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "role": role,
      });
    }

    return true;
  }

  static Future<bool> doGoogleLogin({
    required String role,
  }) async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await saveUserData(role);
      return true;
    } catch (_) {
      return false;
    }
  }

  static doLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}
