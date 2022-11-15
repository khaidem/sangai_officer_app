import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/core.dart';
import '../../core/widget/icon_gradient.widget.dart';
import '../../core/widget/text_gradient.widget.dart';
import '../../tickets/example.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();

  final ref = FirebaseDatabase.instance.ref('2022-11-01');
  String ticket1 = '';
  String ticket2 = '';
  String ticket3 = '';
  String visitor1 = '';
  String visitor2 = '';
  String visitor3 = '';

  @override
  void initState() {
    super.initState();
    ref.onValue.listen((dataValue) {
      final data = Map<String, dynamic>.from(
        dataValue.snapshot.value as Map,
      );
      log(data.toString());
      log(data['sold_count_venue_1'].toString());
      setState(() {
        ticket1 = data['sold_count_venue_1'].toString();
        ticket2 = data['sold_count_venue_2'].toString();
        ticket3 = data['sold_count_venue_3'].toString();
        visitor1 = data['checked_count_venue_1'].toString();
        visitor2 = data['checked_count_venue_2'].toString();
        visitor3 = data['checked_count_venue_3'].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: StreamBuilder(
          stream: ref.onValue,
          builder: (context, AsyncSnapshot snapshot) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const GradientText(
                        'Report',
                        gradient: LinearGradient(colors: [
                          Color(0xfff45b69),
                          Color(0xffffbc11),
                        ]),
                        fontSize: 30,
                      ),
                      getSize(0, 100),
                      Image.asset(
                        KImage.sangailogo,
                        height: 70,
                      ),
                    ],
                  ),
                  getSize(10, 0),
                  Row(
                    children: [
                      const GradientIcon(
                        Icons.confirmation_num,
                        25,
                        LinearGradient(
                          colors: <Color>[
                            Color(0xfff45b69),
                            Color(0xffffbc11),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      getSize(0, 10),
                      Text(
                        'Tickets Sold',
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TicketContainerSoldWidget(
                          venueName: 'Hapta Kangjeibung',
                          number: ticket1,
                          ticketSold: 'TicketSold',
                        ),
                        getSize(0, 10),
                        TicketContainerSoldWidget(
                          venueName: 'Moirng Khunou',
                          number: ticket2,
                          ticketSold: 'TicketSold',
                        ),
                      ],
                    ),
                  ),
                  getSize(10, 0),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TicketContainerSoldWidget(
                          venueName: 'Marjing',
                          number: ticket3,
                          ticketSold: 'TicketSold',
                        ),
                      ],
                    ),
                  ),
                  getSize(20, 0),
                  Row(
                    children: [
                      const GradientIcon(
                        Icons.person,
                        25,
                        LinearGradient(
                          colors: <Color>[
                            Color(0xfff45b69),
                            Color(0xffffbc11),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      getSize(0, 10),
                      Text(
                        'Visitors',
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TicketContainerSoldWidget(
                          venueName: 'Hapta Kangjeibung',
                          number: visitor1,
                          ticketSold: 'TicketSold',
                        ),
                        getSize(0, 10),
                        TicketContainerSoldWidget(
                          venueName: 'Moirng Khunou',
                          number: visitor2,
                          ticketSold: 'TicketSold',
                        ),
                      ],
                    ),
                  ),
                  getSize(10, 0),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TicketContainerSoldWidget(
                          venueName: 'Marjing',
                          number: visitor3,
                          ticketSold: 'TicketSold',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
