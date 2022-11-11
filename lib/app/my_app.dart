import 'package:flutter/material.dart';

import '../home/pages/pages.dart';
import '../router/router.dart';
import '../tickets/pages/ticket.page.dart';
import '../visitors/pages/visitor.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sangai Officer',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          ),
      debugShowCheckedModeBanner: false,
      home: const BottomNavigationBarRouter(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TicketPage.routeName: (context) => const TicketPage(),
        VisitorPage.routName: (context) => const VisitorPage(),
      },
    );
  }
}
