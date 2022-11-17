import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sangai_officer_app/Onbaording/pages/otp_login.page.dart';

import '../../core/constant.dart';
import '../logic/auth_service.provider.dart';
import '../logic/otp_login.provider.dart';

class OtpLoginPage extends StatefulWidget {
  const OtpLoginPage({Key? key}) : super(key: key);
  static const routeName = '/OtpLoginPage';
  static String verify = '';

  @override
  State<OtpLoginPage> createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  var phone = '';
  bool _isLoading = false;
  bool enableButton = false;
  @override
  void initState() {
    _updateAppbar();
    countryController.text = '+91';
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
    countryController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 10,
                child: Image.asset(
                  KImage.sangailogo,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 200,
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'We will send you OTP on this ',
                              style: GoogleFonts.raleway(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'mobile number',
                              style: GoogleFonts.raleway(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff45b69),
                            Color(0xffffbc11),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30,
                                child: TextFormField(
                                  controller: countryController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 33,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Mobile Number',
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChanged: (value) {
                                    phone = value;
                                    log("On Change$value");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        EasyLoading.show(status: 'Please wait');
                        if (mounted) {
                          setState(() {
                            _isLoading = true;
                          });
                        }
                        if (phoneController.text.isEmpty) {
                          EasyLoading.showError('Empty Number');
                        } else {
                          var d =
                              await LoginAPI().checkPhone(phoneController.text);
                          if (d) {
                            EasyLoading.dismiss();

                            context
                                .read<AuthServiceProvider>()
                                .getVerificationPhone(
                                    context,
                                    countryController.text +
                                        phoneController.text)
                                .whenComplete(() => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => VerificationOtpPage(
                                            phoneNUmber:
                                                "+91${phoneController.text}"),
                                      ),
                                    ));
                            EasyLoading.showToast('Success');
                          } else {
                            EasyLoading.showToast('Mobile Number not Register');
                          }
                        }

                        if (mounted) {
                          setState(() {
                            _isLoading = true;
                          });
                        }
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
                            'Request OTP',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     Text(
                    //       'Powered by',
                    //       style: getSemiBoldStyle(color: Colors.black),
                    //     ),
                    //     SizedBox(
                    //       height: 20,
                    //       child: Image.asset(KImage.globizLogo),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
