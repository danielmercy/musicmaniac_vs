import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

enum Role { SPONSOR, FAN, ARTISTE }


@immutable
class User {
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String password;
  final String phone;
  final String genre;
  final String avatar;
  final Map<String, dynamic> address;
  final String role;
  final int rank;
  final String uid;

  User(
      {this.firstname,
      this.uid,
      this.lastname,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.genre,
      this.avatar,
      this.role,
      this.address,
      this.rank});

  String get fullname => "$firstname $lastname";
  String get fullnameReversed => "$lastname $firstname";

  String get _roleToString => role.toString().split('.')[1];

  Map<String, dynamic> toFirebaseMap() {
    return {
      'uid': uid,
      'firstname': firstname ?? '',
      'lastname': lastname ?? '',
      'username': username ?? '',
      'email': email ?? '',
      'phone': phone ?? '',
      'genre': genre ?? '',
      'avatar': avatar ?? '',
      'address': {...address} ?? {},
      'role': role ?? ''
    };
  }

  factory User.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    print("Data from User Model: $data");
    if(data == null)
      return User(
        uid: snapshot.documentID,
        firstname: 'Music',
        lastname:  'Maniac',
      );

    return User(
      uid: snapshot.documentID,
      firstname: data['firstname'] ?? '',
      lastname: data['lastname'] ?? '',
      email: data['email'] ?? '',
      genre: data['genre'] ?? '',
      phone: data['phone'] ?? '',
      username: data['username'] ?? '',
      rank: data['rank'] ?? 0,
      role: data['role'] ?? 'fan',
      avatar: data['avatar'] ?? '',
      address: {...data['address'] ?? {}},
    );
  }

  // static String capitalize(String value) {
  //   final String firstLetter = value[0];
  //   value.indexOf(firstLetter);
  // }
}

