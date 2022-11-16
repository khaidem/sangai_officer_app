import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constant.dart';

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
                left: 0,
                top: 50,
                child: Image.asset(
                  KImage.sangailogo,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'AGENT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Login',
                      // style: getExtraStyle(
                      //   color: const Color(0xfff45b69),
                      // ),
                    ),
                    // getSizeBox(50.0),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'We will send you OTP on this ',
                              // style: getSemiBoldStyle(color: Colors.black),
                            ),
                            Text(
                              'mobile number',
                              // style: getSemiBoldStyle(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                    // getSizeBox(20),

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
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // getSizeBox(20),
                    InkWell(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            _isLoading = true;
                          });
                        }
                        if (phoneController.text.isEmpty) {
                          // showErrorHUD(title: "Number can't be Empty");
                        } else {
                          // EasyLoading.show(status: 'Please wait');

                          // context.read<AuthService>().getVerificationPhone(
                          //     context, countryController.text + phone);
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
