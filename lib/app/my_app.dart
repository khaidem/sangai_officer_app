import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Onbaording/pages/opt_login.page.dart';
import '../home/pages/pages.dart';
import '../router/router.dart';
import '../tickets/pages/ticket.page.dart';
import '../visitors/pages/visitor.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'sangai Officer',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snaShot) {
          if (snaShot.hasData) {
            return const BottomNavigationBarRouter();
          }
          return const OtpLoginPage();
        },
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TicketPage.routeName: (context) => const TicketPage(),
        VisitorPage.routName: (context) => const VisitorPage(),
        BottomNavigationBarRouter.routeName: (context) =>
            const BottomNavigationBarRouter(),
        OtpLoginPage.routeName: (context) => const OtpLoginPage()
      },
    );
  }
}
