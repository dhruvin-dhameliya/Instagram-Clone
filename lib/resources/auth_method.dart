import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instaclon_flutterfire/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> SignUpUser({
    required String email,
    required String password,
    required String username,
    required String fullname,
    required Uint8List file,
  }) async {
    String res = "Some error occured.";
    String photoUrl;
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          fullname.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        photoUrl = await StorageMethods()
            .uplodeImageToStorage('profilePics', file, false);

        await _firestore.collection('Users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'fullname': fullname,
          'password': password,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });

        res = "Success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
