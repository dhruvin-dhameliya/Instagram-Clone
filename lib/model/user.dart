import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String fullname;
  final String password;
  final List followers;
  final List following;
  final String photoUrl;

  User({
    required this.username,
    required this.uid,
    required this.email,
    required this.fullname,
    required this.password,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'fullname': fullname,
        'password': password,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      fullname: snapshot['fullname'],
      password: snapshot['password'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
