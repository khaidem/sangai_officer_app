import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home/example.dart';
import '../tickets/example.dart';
import '../visitors/example.dart';

class BottomNavigationBarRouter extends StatefulWidget {
  const BottomNavigationBarRouter({Key? key}) : super(key: key);
  static const routeName = '/BottomNavigationBarRouter';

  @override
  State<BottomNavigationBarRouter> createState() =>
      _BottomNavigationBarRouterState();
}

class _BottomNavigationBarRouterState extends State<BottomNavigationBarRouter> {
  int currentIndex = 0;
  String? currentpage;
  //** Add Page For BottomNavigation  */
  final List pages = [
    const HomePage(),
    const TicketPage(),
    const VisitorPage()
  ];
  //*** This For  BottomNavigationPage to Set Global Declare so that all the page get
//**   BottomNavigation */  */
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xfff45b69),
        unselectedItemColor: Colors.grey.shade700,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Today Report',
            icon: Icon(FontAwesomeIcons.house),
          ),
          BottomNavigationBarItem(
            label: 'Ticket Sold',
            icon: Icon(FontAwesomeIcons.ticket),
          ),
          BottomNavigationBarItem(
            label: 'Visitor Count',
            icon: Icon(FontAwesomeIcons.users),
          ),
        ],
      ),
      body: Stack(children: [buildNavigator()]),
    );
  }

  // ** The route generator callback used when the app is navigated to a named
//**route. This is used if routes do not contain the requested route.
  buildNavigator() {
    return Navigator(
      key: navigatorKeys[currentIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) => pages.elementAt(currentIndex),
        );
      },
    );
  }
}
