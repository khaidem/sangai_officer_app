import 'package:flutter/material.dart';
import 'package:sangai_officer_app/tickets/widgets/widgets.dart';
import 'package:sangai_officer_app/visitors/widgets/row_vistor.widdget.dart';
import 'package:sangai_officer_app/visitors/widgets/ticket_container_visitor.widget.dart';

import '../../core/core.dart';
import '../../core/widget/text_gradient.widget.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({Key? key}) : super(key: key);
  static const routName = '/VisitorPage';
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
                    "Vistors",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const GradientText(
                    'Count',
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
              const RowVisitorWidget(dayName: 'Day 1', date: '22st Nov 2022'),
              getSize(20, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TicketContainerSoldWidget(
                        venueName: 'Hapta Kangjeibung',
                        number: '1,500',
                        ticketSold: 'Visitors'),
                  ),
                  getSize(0, 10),
                  const Expanded(
                    child: TicketContainerSoldWidget(
                        venueName: 'Moirng Khunou',
                        number: '1,500',
                        ticketSold: 'Visitors'),
                  ),
                ],
              ),
              getSize(10, 0),
              Row(
                children: const [
                  TicketContainerVisitorWidget(
                      venueName: 'Moirang',
                      number: '1,500',
                      ticketSold: 'Visitor')
                ],
              ),
              getSize(20, 0),
              const RowVisitorWidget(dayName: 'Day 2', date: '22st Nov 2022'),
              getSize(20, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TicketContainerSoldWidget(
                      venueName: 'Hapta Kangjeibung',
                      number: '1,500',
                      ticketSold: 'Visitors'),
                  getSize(0, 10),
                  const TicketContainerSoldWidget(
                      venueName: 'Moirng Khunou',
                      number: '1,500',
                      ticketSold: 'Visitors'),
                ],
              ),
              getSize(10, 0),
              Row(
                children: const [
                  FittedBox(
                    child: TicketContainerVisitorWidget(
                        venueName: 'Moirang',
                        number: '1,500',
                        ticketSold: 'Visitor'),
                  )
                ],
              ),
              getSize(20, 0),
              const RowVisitorWidget(dayName: 'Day 3', date: '22st Nov 2022'),
              getSize(20, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TicketContainerSoldWidget(
                      venueName: 'Hapta Kangjeibung',
                      number: '1,500',
                      ticketSold: 'Visitors'),
                  getSize(0, 10),
                  const TicketContainerSoldWidget(
                      venueName: 'Moirng Khunou',
                      number: '1,500',
                      ticketSold: 'Visitors'),
                ],
              ),
              getSize(10, 0),
              Row(
                children: const [
                  TicketContainerVisitorWidget(
                      venueName: 'Moirang',
                      number: '1,500',
                      ticketSold: 'Visitor')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
