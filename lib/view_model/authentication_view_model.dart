// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twinku_blog/constants/constant.dart';
import 'package:twinku_blog/views/bottom_NavBar.dart';
import 'package:twinku_blog/views/home_screen.dart';
import 'package:twinku_blog/views/login_screen.dart';

class AuthViewModel extends GetxController {
  static AuthViewModel instance = Get.find();
  late Rx<User?> firebaseUser;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the login Screen
      Get.offAll(() => LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => BottomNavBar());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the login Screen
      Get.offAll(() => LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => BottomNavBar());
    }
  }


  void signInWithGoogle() async {
   try {
    GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

    if (googleSignInAccount != null) {
     GoogleSignInAuthentication googleSignInAuthentication =
     await googleSignInAccount.authentication;

     AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
     );

     await auth
         .signInWithCredential(credential)
         .catchError((onErr) => print(onErr));
    }
   } catch (e) {
    Get.snackbar(
     "Error",
     e.toString(),
     snackPosition: SnackPosition.BOTTOM,
    );
    print(e.toString());
   }
  }

  void login(String email, password) async {
   try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
   } catch (firebaseAuthException) {
    print(firebaseAuthException);
   }
  }
}
