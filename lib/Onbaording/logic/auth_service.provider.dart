import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sangai_officer_app/Onbaording/pages/otp_login.page.dart';
import 'package:sangai_officer_app/router/router.dart';

import '../pages/login.page.dart';

class AuthServiceProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> getVerificationPhone(
      BuildContext context, String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 5),
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _auth
                .signInWithCredential(phoneAuthCredential)
                .then((value) async {
              if (value.user != null) {
                debugPrint('User logged in');
              }
            });
            // showSuccess(title: phoneAuthCredential.token.toString());
          },
          verificationFailed: (FirebaseException e) {
            // showErrorHUD(
            //   title: "INVALID PHONE NUMBER $e",
            // );
            EasyLoading.showError('Invalid Phone$e');
            // logger.e(e.toString());
            // if (e.code == 'invalid-phone-number$e') {
            //   showErrorHUD(
            //     title: "INVALID PHONE NUMBER ",
            //   );
            // }

            // if (e.code == "quota-exceeded") {
            //   showErrorHUD(
            //     title: "Quata exceeded $e",
            //   );
            //   print("Quata exceeded $e");
            // }
            // logger.e(e.toString());
          },
          codeSent: (String verificationId, int? resendToken) {
            OtpLoginPage.verify = verificationId;

            // EasyLoading.showSuccess('Success');

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => VerificationOtpPage(phoneNUmber: phoneNumber),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verification) {});
    } catch (error) {
      // showErrorHUD(title: error.toString());
      debugPrint(
        error.toString(),
      );
    }
  }

  Future<bool> otpVerification(String code, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: OtpLoginPage.verify, smsCode: code);
      await _auth.signInWithCredential(credential);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const BottomNavigationBarRouter(),
        ),
      );
      // _firestore.collection('user_accounts').doc(_auth.currentUser!.uid).set({
      //   'active': true,
      //   'created_at': Timestamp.now(),
      //   'phone_number': _auth.currentUser!.phoneNumber,
      //   'uid': _auth.currentUser!.uid,
      //   'email': ''
      // });
      return true;
    } catch (e) {
      // showErrorHUD(title: e.toString());
      debugPrint(
        e.toString(),
      );
      return false;
    }
  }

  signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/');

    // showSuccess(title: 'SuccessFully LogOut');
  }
}
