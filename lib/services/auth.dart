import 'package:app_benh_nhan/models/myuser.dart';
import 'package:app_benh_nhan/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create MyUser object based on User
  GetUser _userFromFirebaseUser(User? user) {
    if (user != null) {
      return GetUser(uid: user.uid);
    } else {
      // Xử lý trường hợp user là null, ví dụ, bằng cách ném một ngoại lệ.
      throw Exception("null");
    }
  }

  // auth change user stream
  Stream<GetUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  //sign in anonymus
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
    } catch (e) {
      print(e.toString());
      null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // create e new document for the user with uid
      await DatabaseService(uid: user!.uid)
          .updateUserData('', '', '', '', '', '', '', '', '','','');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
