import 'package:evently_app/core/services/snack_bar_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseFunctions {



  static Future<bool> createAccount(String email, String password) async{
    EasyLoading.show();

    try{
      UserCredential credential=
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email,
         password: password,
       );
       SnackBarServices.showSuccessMessage("Account Created Successfully");
       return Future.value(true);
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        SnackBarServices.showErrorMessage(e.message ?? "The password provided is too weak.");
        return Future.value(false);

      } else if (e.code == 'email-already-in-use') {
        SnackBarServices.showErrorMessage(e.message ?? "The account already exists for that email.");
        return Future.value(false);

      }
      return Future.value(false);

    } catch (e){
      return Future.value(false);
    }

  }


  static Future<bool> login(String email, String password) async{
    EasyLoading.show();

    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      SnackBarServices.showSuccessMessage("Logged In Successfully");
      return Future.value(true);
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        SnackBarServices.showErrorMessage(e.message ?? "User Is Not Found");
        return Future.value(false);

      } else if (e.code == 'wrong-password') {
        SnackBarServices.showErrorMessage(e.message ?? "Wrong password");
        return Future.value(false);

      }
      return Future.value(false);

    } catch (e){
      return Future.value(false);
    }

  }



}
