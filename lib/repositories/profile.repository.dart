import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicmaniac/models/user.model.dart';

abstract class BaseProfile {
  dynamic currentUser(String uid);
  // Future<User> updateInfo(Map<String, dynamic> data);

}

class ProfileService implements BaseProfile {
  // final AuthProvider _auth = AuthProvider();
  final Firestore _firestore = Firestore.instance;

  @override
  Future<User> currentUser(String uid) async  {
    // print('User ID from profile service: $uid');
    DocumentSnapshot snapshot = await _firestore.collection('users').document(uid).get();
    // print(snapshot.data);
    return User.fromFirestore(snapshot);
  }
}
