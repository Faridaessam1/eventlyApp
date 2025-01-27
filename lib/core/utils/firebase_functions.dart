import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {



  static createAccount(String email, String password) async{

    try{ UserCredential credential=
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }

  }




}
