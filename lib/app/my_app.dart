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
