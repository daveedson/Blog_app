// ignore_for_file: avoid_print, constant_identifier_names


import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twinku_blog/constants/constant.dart';
import 'package:twinku_blog/services/create_post_service.dart';
import 'package:twinku_blog/views/bottom_NavBar.dart';
import 'package:twinku_blog/views/login_screen.dart';


enum authProblems { UserNotFound, PasswordNotValid, NetworkError }


class AuthViewModel extends GetxController {
 static AuthViewModel instance = Get.find();
 late Rx<User?> firebaseUser;

 String? uid;


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
   uid = user.uid;
   print(user.uid);

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


 Future <void> signInWithGoogle() async {
  try {
   GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

   if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
     accessToken: googleSignInAuthentication.accessToken,
     idToken: googleSignInAuthentication.idToken,
    );

    await auth.signInWithCredential(credential).catchError((onErr) =>
        print(onErr));
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

 Future<void> login(String email, password) async {
  try {
   // showDialog(
   //  context: context,
   //  barrierDismissible: false,
   //  barrierColor: Colors.transparent,
   //  builder: (context) => ProgressLoader(),
   // );
   await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  catch (e) {
   // authProblems errorType;
   // if (Platform.isAndroid) {
   //  switch (e.message) {
   //   case 'There is no user record corresponding to this identifier. The user may have been deleted.':
   //    errorType = authProblems.UserNotFound;
   //    break;
   //   case 'The password is invalid or the user does not have a password.':
   //    errorType = authProblems.PasswordNotValid;
   //    break;
   //   case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
   //    errorType = authProblems.NetworkError;
   //    break;
   //  // ...
   //   default:
   //    print('Case ${e.message} is not yet implemented');
   //  }
   // } else if (Platform.isIOS) {
   //  switch (e.code) {
   //   case 'Error 17011':
   //    errorType = authProblems.UserNotFound;
   //    break;
   //   case 'Error 17009':
   //    errorType = authProblems.PasswordNotValid;
   //    break;
   //   case 'Error 17020':
   //    errorType = authProblems.NetworkError;
   //    break;
   //  // ...
   //   default:
   //    print('Case ${e.message} is not yet implemented');
   //  }
   // }
   // print('The error is $errorType');

  }
 }
}
