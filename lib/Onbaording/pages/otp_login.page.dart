import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:sangai_officer_app/Onbaording/pages/login.page.dart';
import 'package:sangai_officer_app/router/router.dart';

import '../../core/constant.dart';

class VerificationOtpPage extends StatefulWidget {
  const VerificationOtpPage({Key? key, required this.phoneNUmber})
      : super(key: key);
  static const routeName = '/VerificationOtpPage';
  final String phoneNUmber;

  @override
  State<VerificationOtpPage> createState() => _VerificationOtpPageState();
}

class _VerificationOtpPageState extends State<VerificationOtpPage>
    with SingleTickerProviderStateMixin {
  int levelClock = 180;
  AnimationController? _controller;
  final focusNode = FocusNode();
  TextEditingController otpSend = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: levelClock,
      ),
    );
    _controller!.forward();
    _updateAppbar();
    super.initState();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white24,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));
  }

  @override
  void dispose() {
    _controller!.dispose();
    otpSend.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 123, 172, 214),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [
        //     Color(0xfff45b69),
        //     Color(0xffffbc11),
        //   ],
        // ),
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: const Color(0xfff45b69),
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 30,
              top: 50,
              child: Image.asset(
                KImage.sangailogo,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    'AGENT',
                    style: GoogleFonts.raleway(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),

                  Text(
                    'Login',
                    style: GoogleFonts.raleway(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xfff45b69),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.end,
                            textDirection: TextDirection.rtl,
                            textScaleFactor: 1,
                            softWrap: true,
                            maxLines: 1,
                            text: TextSpan(
                              text: 'Enter',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                              children: [
                                const TextSpan(
                                    text: ' OTP',
                                    style: TextStyle(
                                      color: Color(0xfff45b69),
                                    )),
                                const TextSpan(text: ' '),
                                const TextSpan(text: 'send to'),
                                const TextSpan(text: '  '),
                                TextSpan(text: widget.phoneNUmber),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Pinput(
                    // androidSmsAutofillMethod:
                    //     AndroidSmsAutofillMethod.smsRetrieverApi,
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    onCompleted: (value) {
                      code = value;
                    },
                    // onCompleted: (verify) {
                    //   setState(() {
                    //     code = verify;

                    //     // context.read<AuthService>().otpVerification(code).then(
                    //     //   (value) {
                    //     //     if (value) {
                    //     //       return Navigator.of(context)
                    //     //           .pushNamedAndRemoveUntil(
                    //     //         BottomNavigationBarRouter.routeName,
                    //     //         (route) => false,
                    //     //       );
                    //     //     }
                    //     //   },
                    //     // );
                    //   });
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      EasyLoading.show(status: 'Verifying...');
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: OtpLoginPage.verify,
                                smsCode: code);

                        await auth.signInWithCredential(credential);

                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            BottomNavigationBarRouter.routeName,
                            (route) => false);
                        EasyLoading.dismiss();
                      } catch (error) {
                        EasyLoading.showError('Invalid OTP');
                      }

                      // setState(() {
                      //   // context
                      //   //     .read<AuthServiceProvider>()
                      //   //     .otpVerification(code, context)
                      //   //     .then(
                      //   //   (value) {
                      //   //     if (value) {
                      //   //       EasyLoading.dismiss();
                      //   //       return Navigator.of(context)
                      //   //           .pushNamedAndRemoveUntil(
                      //   //         BottomNavigationBarRouter.routeName,
                      //   //         (route) => false,
                      //   //       );
                      //   //     }
                      //   //   },
                      //   // );
                      // });
                    },
                    child: Container(
                      width: 500,
                      height: 55,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          // stops: [0.0, 0.0],
                          colors: [
                            Color(0xfff45b69),
                            Color(0xffffbc11),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: const [
                  //     Text('Wait: '),
                  //     // Countdown(
                  //     //   animation: StepTween(begin: levelClock, end: 0)
                  //     //       .animate(_controller!),
                  //     // ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
