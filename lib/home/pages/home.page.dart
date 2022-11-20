import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangai_officer_app/core/widget/text_gradient.widget.dart';
import 'package:sangai_officer_app/home/example.dart';

import '../../core/core.dart';
import '../../core/widget/icon_gradient.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final d = DateTime.now().toString();
  List listData = [];

  String? ticket1;
  String? ticket2;
  String? ticket3;
  String? visitor1;
  String? visitor2;
  String? visitor3;
  String? paperTicket1;
  String? paperTicket2;
  String? paperTicket3;

  @override
  void initState() {
    super.initState();

    var timeSplit = d.split(' ');
    try {
      final ref =
          FirebaseDatabase.instance.ref().child('tickets').child(timeSplit[0]);

      ref.onValue.listen((dataValue) {
        var data = Map<String, dynamic>.from(
          dataValue.snapshot.value as Map,
        );

        log('Show Data Form Firebase $data');
        if (!mounted) {
          return;
        }
        if (listData.isEmpty) {
          return log('Empty Data');
        }

        setState(() {
          ticket1 = data['sold_e_1'].toString();
          ticket2 = data['sold_e_2'].toString();
          ticket3 = data['sold_e_3'].toString();
          paperTicket1 = data['sold_p_1'].toString();
          paperTicket2 = data['sold_p_2'].toString();
          paperTicket3 = data['sold_p_3'].toString();

          visitor1 = data['checked_1'].toString();
          visitor2 = data['checked_2'].toString();
          visitor3 = data['checked_3'].toString();
        });
      });
    } catch (error) {
      rethrow;
    }
  }

  final Shader linearGradient = const LinearGradient(
    colors: [
      Color(0xffffbc11),
      Color(0xfff45b69),
    ],
  ).createShader(
    const Rect.fromLTWH(0, 0, 0.4, 0.1),
  );

  @override
  Widget build(BuildContext context) {
    if (ticket1 == null) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(43),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    const GradientText(
                      'Report',
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfff45b69),
                          Color(0xffffbc11),
                        ],
                      ),
                      fontSize: 30,
                    ),
                    const Spacer(),
                    Image.asset(
                      KImage.sangailogo,
                      height: 100,
                    ),
                  ],
                ),
                getSize(250, 0),
                const Text(
                  'No Report',
                  style: TextStyle(),
                )
              ],
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(43),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    const GradientText(
                      'Report',
                      gradient: LinearGradient(colors: [
                        Color(0xfff45b69),
                        Color(0xffffbc11),
                      ]),
                      fontSize: 30,
                    ),
                    const Spacer(),
                    Image.asset(
                      KImage.sangailogo,
                      height: 100,
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
                      'E-Tickets Sold',
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Hapta Kangjeibung',
                    number: ticket1 ?? '',
                    image: KImage.ticketsLowOpac),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Moirang Khunou',
                    number: ticket2 ?? '',
                    image: KImage.ticketsLowOpac),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Marjing',
                    number: ticket2 ?? '',
                    image: KImage.ticketsLowOpac),
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
                      'Paper Tickets Sold',
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Hapta Kangjeibung',
                    number: paperTicket1 ?? '',
                    image: KImage.ticketsLowOpac),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Moirang Khunou',
                    number: paperTicket2 ?? '',
                    image: KImage.ticketsLowOpac),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Marjing',
                    number: paperTicket3 ?? '',
                    image: KImage.ticketsLowOpac),
                getSize(10, 0),
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
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Hapta Kangjeibung',
                    number: visitor1 ?? '',
                    image: KImage.visitorLowOpac),
                getSize(10, 0),
                TicketContainerWidget(
                    venueName: 'Moirang Khunou',
                    number: visitor2 ?? '',
                    image: KImage.visitorLowOpac),
                getSize(10, 0),
                TicketContainerWidget(
                  venueName: 'Marjing',
                  number: visitor3 ?? '',
                  image: KImage.visitorLowOpac,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
