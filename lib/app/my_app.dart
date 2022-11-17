import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sangai_officer_app/Onbaording/logic/auth_service.provider.dart';

import '../home/pages/pages.dart';
import '../router/router.dart';
import '../tickets/pages/ticket.page.dart';
import '../visitors/pages/visitor.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthServiceProvider(),
        )
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        title: 'sangai Officer',
        debugShowCheckedModeBanner: false,
        home: const BottomNavigationBarRouter(),
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (ctx, snaShot) {
        //     if (snaShot.hasData) {
        //       return const BottomNavigationBarRouter();
        //     }
        //     return const OtpLoginPage();
        //   },
        // ),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          TicketPage.routeName: (context) => const TicketPage(),
          VisitorPage.routName: (context) => const VisitorPage(),
          BottomNavigationBarRouter.routeName: (context) =>
              const BottomNavigationBarRouter()
        },
      ),
    );
  }
}
