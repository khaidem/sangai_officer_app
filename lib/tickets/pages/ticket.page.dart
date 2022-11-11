import 'package:flutter/material.dart';
import 'package:sangai_officer_app/core/constant.dart';
import 'package:sangai_officer_app/core/text_style.dart';
import 'package:sangai_officer_app/tickets/widgets/widgets.dart';

import '../../core/widget/text_gradient.widget.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);
  static const routeName = '/TicketPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 30,
              child: Image.asset(
                KImage.sangailogo,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSize(100, 0),
                  Row(
                    children: [
                      const Text(
                        "Today's",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      getSize(0, 5),
                      const GradientText(
                        'Sold',
                        gradient: LinearGradient(colors: [
                          Color(0xfff45b69),
                          Color(0xffffbc11),
                        ]),
                        fontSize: 30,
                      ),
                    ],
                  ),
                  getSize(20, 0),
                  const RowSoldWidget(dayName: 'Day 1', date: '23st Nov 2022'),
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
                  const RowSoldWidget(dayName: 'Day 2', date: '23st Nov 2022'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
