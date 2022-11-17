import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sangai_officer_app/Onbaording/logic/auth_service.provider.dart';
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

  String ticket1 = '';
  String ticket2 = '';
  String ticket3 = '';
  String visitor1 = '';
  String visitor2 = '';
  String visitor3 = '';

  @override
  void initState() {
    super.initState();
    var timeSplit = d.split(' ');
    final ref =
        FirebaseDatabase.instance.ref().child('tickets').child(timeSplit[0]);

    ref.onValue.listen((dataValue) {
      final data = Map<String, dynamic>.from(
        dataValue.snapshot.value as Map,
      );
      log(data.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        ticket1 = data['sold_e_1'].toString();
        ticket2 = data['sold_e_2'].toString();
        ticket3 = data['sold_e_3'].toString();
        visitor1 = data['checked_1'].toString();
        visitor2 = data['checked_2'].toString();
        visitor3 = data['checked_3'].toString();
      });
      log(ticket1.toString());
    });
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
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
                    height: 70,
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(''),
                              content: const Text('Do You want to logOut?'),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    context
                                        .read<AuthServiceProvider>()
                                        .signOut(context);
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.logout))
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
              getSize(10, 0),
              TicketContainerWidget(
                  venueName: 'Hapta Kangjeibung',
                  number: ticket1,
                  image: KImage.ticketsLowOpac),
              getSize(10, 0),
              TicketContainerWidget(
                  venueName: 'Moirang Khunou',
                  number: ticket2,
                  image: KImage.ticketsLowOpac),
              getSize(10, 0),
              TicketContainerWidget(
                  venueName: 'Marjing',
                  number: ticket2,
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
                  number: visitor1,
                  image: KImage.visitorLowOpac),
              getSize(10, 0),
              TicketContainerWidget(
                  venueName: 'Moirang Khunou',
                  number: visitor2,
                  image: KImage.visitorLowOpac),
              getSize(10, 0),
              TicketContainerWidget(
                  venueName: 'Marjing',
                  number: visitor3,
                  image: KImage.visitorLowOpac),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: TicketContainerSoldWidget(
              //         venueName: 'Hapta Kangjeibung',
              //         number: ticket1,
              //         ticketSold: 'TicketSold',
              //       ),
              //     ),
              //     getSize(0, 10),
              //     Expanded(
              //       flex: 1,
              //       child: TicketContainerSoldWidget(
              //         venueName: 'Moirang Khunou',
              //         number: ticket2,
              //         ticketSold: 'TicketSold',
              //       ),
              //     ),
              //   ],
              // ),
              // getSize(10, 0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: TicketContainerSoldWidget(
              //         venueName: 'Marjing',
              //         number: ticket3,
              //         ticketSold: 'TicketSold',
              //       ),
              //     ),
              //     getSize(0, 10),
              //     Expanded(flex: 1, child: Container())
              //   ],
              // ),
              // getSize(20, 0),
              // Row(
              //   children: [
              //     const GradientIcon(
              //       Icons.person,
              //       25,
              //       LinearGradient(
              //         colors: <Color>[
              //           Color(0xfff45b69),
              //           Color(0xffffbc11),
              //         ],
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //       ),
              //     ),
              //     getSize(0, 10),
              //     Text(
              //       'Visitors',
              //       style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontSize: 20,
              //         fontWeight: FontWeight.w800,
              //       ),
              //     ),
              //   ],
              // ),
              // getSize(10, 0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: TicketContainerSoldWidget(
              //         venueName: 'Hapta Kangjeibung',
              //         number: visitor1,
              //         ticketSold: 'TicketSold',
              //       ),
              //     ),
              //     getSize(0, 10),
              //     Expanded(
              //       child: TicketContainerSoldWidget(
              //         venueName: 'Moirang Khunou',
              //         number: visitor2,
              //         ticketSold: 'TicketSold',
              //       ),
              //     ),
              //   ],
              // ),
              // getSize(10, 0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: TicketContainerSoldWidget(
              //         venueName: 'Marjing',
              //         number: visitor3,
              //         ticketSold: 'TicketSold',
              //       ),
              //     ),
              //     Expanded(flex: 1, child: Container())
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
