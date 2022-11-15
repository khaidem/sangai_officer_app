import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sangai_officer_app/tickets/widgets/widgets.dart';

import '../../core/core.dart';
import '../../core/widget/text_gradient.widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);
  static const routeName = '/TicketPage';

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final ref = FirebaseDatabase.instance.ref();
  List dateTime = ['2022-11-01', '2022-11-02'];
  List ticketSold = [];
  @override
  void initState() {
    super.initState();
    ref.onValue.listen((dataValue) {
      final data = Map<String, dynamic>.from(
        dataValue.snapshot.value as Map,
      );
      data.forEach((key, value) {
        ticketSold.add(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: ref.onValue,
          builder: (ctx, snap) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tickets",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      const GradientText(
                        'Sold',
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
                    ],
                  ),
                  const RowSoldWidget(dayName: 'Day 1', date: '21st Nov 2022'),
                  getSize(20, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TicketContainerSoldWidget(
                        venueName: 'Hapta Kangjeibung',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                      getSize(0, 10),
                      const TicketContainerSoldWidget(
                        venueName: 'Moirng Khunou',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(10, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TicketContainerSoldWidget(
                        venueName: 'Marjing',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(20, 0),
                  const RowSoldWidget(dayName: 'Day 2', date: '22st Nov 2022'),
                  getSize(20, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TicketContainerSoldWidget(
                        venueName: 'Hapta Kangjeibung',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                      getSize(0, 10),
                      const TicketContainerSoldWidget(
                        venueName: 'Moirng Khunou',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(10, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TicketContainerSoldWidget(
                        venueName: 'Marjing',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(20, 0),
                  const RowSoldWidget(dayName: 'Day 3', date: '23st Nov 2022'),
                  getSize(20, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TicketContainerSoldWidget(
                        venueName: 'Hapta Kangjeibung',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                      getSize(0, 10),
                      const TicketContainerSoldWidget(
                        venueName: 'Moirng Khunou',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(10, 0),
                  Row(
                    children: const [
                      TicketContainerSoldWidget(
                        venueName: 'Marjing',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(20, 0),
                  const RowSoldWidget(dayName: 'Day 3', date: '24st Nov 2022'),
                  getSize(20, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TicketContainerSoldWidget(
                        venueName: 'Hapta Kangjeibung',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                      getSize(0, 10),
                      const TicketContainerSoldWidget(
                        venueName: 'Moirng Khunou',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                  getSize(10, 0),
                  Row(
                    children: const [
                      TicketContainerSoldWidget(
                        venueName: 'Marjing',
                        number: '1,500',
                        ticketSold: 'TicketSold',
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
