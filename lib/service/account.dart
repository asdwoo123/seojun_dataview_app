import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;


bool emailValidate(String email) {
  RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]'
  r'{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(email);
}

/*bool pwdValidate(String password) {

}*/

void signInService(String email, String password, bool remember) async {
  print(email + password);
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    if (remember) {
      await auth.setPersistence(Persistence.SESSION);
    } else {
      await auth.setPersistence(Persistence.NONE);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

void signUpService(String email, String password) async {
  try {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {

    }
  }
}

void signOutService() async {
  await auth.signOut();
}

FirebaseAuth getAuth() {
  return auth;
}

User? getUser() {
  return auth.currentUser;
}
