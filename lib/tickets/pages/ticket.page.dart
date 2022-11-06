import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangai_officer_app/core/constant.dart';
import 'package:sangai_officer_app/core/text_style.dart';
import 'package:sangai_officer_app/tickets/widgets/widgets.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);
  static const routeName = '/TicketPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Image.asset(KImage.sangailogo),
              ),
              getSize(10, 0),
              RichText(
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                textScaleFactor: 1,
                text: TextSpan(
                  text: "Today's",
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                  children: [
                    const WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: SizedBox(width: 10)),
                    TextSpan(
                      text: 'Sold',
                      style: GoogleFonts.raleway(
                          color: const Color(0xfff45b69),
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              getSize(20, 0),
              const RowSoldWidget(dayName: 'Day 1', date: '23st Nov 2022'),
              getSize(20, 0),
              Row(
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
              const RowSoldWidget(dayName: 'Day 2', date: '23st Nov 2022'),
              getSize(20, 0),
              Row(
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
              const RowSoldWidget(dayName: 'Day 3', date: '23st Nov 2022'),
              getSize(20, 0),
              Row(
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
      ),
    );
  }
}
