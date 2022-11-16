// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../example.dart';

// class VerificationOtpPage extends StatefulWidget {
//   const VerificationOtpPage({Key? key, required this.phoneNUmber})
//       : super(key: key);
//   static const routeName = '/VerificationOtpPage';
//   final String phoneNUmber;

//   @override
//   State<VerificationOtpPage> createState() => _VerificationOtpPageState();
// }

// class _VerificationOtpPageState extends State<VerificationOtpPage>
//     with SingleTickerProviderStateMixin {
//   int levelClock = 180;
//   AnimationController? _controller;
//   final focusNode = FocusNode();
//   TextEditingController otpSend = TextEditingController();
//   var code = '';
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(
//         seconds: levelClock,
//       ),
//     );
//     _controller!.forward();
//     _updateAppbar();
//     super.initState();
//   }

//   void _updateAppbar() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.white24,
//       statusBarIconBrightness: Brightness.dark,
//       //or set color with: Color(0xFF0000FF)
//     ));
//   }

//   @override
//   void dispose() {
//     _controllerflutter_easyloading!.dispose();
//     otpSend.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           color: Color.fromARGB(255, 123, 172, 214),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.black,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Colors.blue),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: const Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Positioned(
//               left: 0,
//               top: 50,
//               child: Image.asset(
//                 KImage.sangaiLogo,
//                 height: 100,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(35),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   getSizeBox(130.0),
//                   const Text(
//                     'AGENT',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text('Login',
//                       style: getExtraStyle(color: const Color(0xfff45b69))),
//                   getSizeBox(50.0),
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RichText(
//                             overflow: TextOverflow.clip,
//                             textAlign: TextAlign.end,
//                             textDirection: TextDirection.rtl,
//                             textScaleFactor: 1,
//                             softWrap: true,
//                             maxLines: 1,
//                             text: TextSpan(
//                               text: 'Enter',
//                               style: getSemiBoldStyle(color: Colors.black),
//                               children: [
//                                 const TextSpan(
//                                     text: ' OTP',
//                                     style: TextStyle(
//                                       color: Color(0xfff45b69),
//                                     )),
//                                 const TextSpan(text: ' '),
//                                 const TextSpan(text: 'send to'),
//                                 const TextSpan(text: '  '),
//                                 TextSpan(text: widget.phoneNUmber),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   getSizeBox(20),
//                   Pinput(
//                     androidSmsAutofillMethod:
//                         AndroidSmsAutofillMethod.smsRetrieverApi,
//                     length: 6,
//                     showCursor: true,
//                     defaultPinTheme: defaultPinTheme,
//                     focusedPinTheme: focusedPinTheme,
//                     submittedPinTheme: submittedPinTheme,
//                     onCompleted: (verify) {
//                       setState(() {
//                         code = verify;

//                         context.read<AuthService>().otpVerification(code).then(
//                           (value) {
//                             if (value) {
//                               return Navigator.of(context)
//                                   .pushNamedAndRemoveUntil(
//                                 BottomNavigationBarRouter.routeName,
//                                 (route) => false,
//                               );
//                             }
//                           },
//                         );
//                       });
//                     },
//                   ),
//                   getSizeBox(20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       const Text('Wait: '),
//                       Countdown(
//                         animation: StepTween(begin: levelClock, end: 0)
//                             .animate(_controller!),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }