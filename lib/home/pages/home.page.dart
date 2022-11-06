import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangai_officer_app/core/constant.dart';
import 'package:sangai_officer_app/core/text_style.dart';
import 'package:sangai_officer_app/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      text: 'Report',
                      style: GoogleFonts.raleway(
                          color: const Color(0xfff45b69),
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              getSize(20, 0),
              Row(
                children: [
                  const Icon(Icons.confirmation_num),
                  getSize(0, 10),
                  Text(
                    'Tickets Sold',
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              getSize(20, 0),
              const TicketContainerWidget(
                venueName: 'Hapta kangjeibung',
                number: '1,500',
                image: KImage.ticketsLowOpac,
              ),
              getSize(10, 0),
              const TicketContainerWidget(
                venueName: 'Moirang Khunou',
                number: '1,500',
                image: KImage.ticketsLowOpac,
              ),
              getSize(10, 0),
              const TicketContainerWidget(
                venueName: 'Marjing',
                number: '1,500',
                image: KImage.ticketsLowOpac,
              ),
              getSize(20, 0),
              Row(
                children: [
                  const Icon(Icons.person),
                  getSize(0, 10),
                  Text(
                    'Visitors',
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              getSize(10, 0),
              const TicketContainerWidget(
                venueName: 'Hapta kangjeibung',
                number: '1,500',
                image: KImage.visitorLowOpac,
              ),
              getSize(10, 0),
              const TicketContainerWidget(
                venueName: 'Moirang Khunou',
                number: '1,500',
                image: KImage.visitorLowOpac,
              ),
              getSize(10, 0),
              const TicketContainerWidget(
                venueName: 'Marjing',
                number: '1,500',
                image: KImage.visitorLowOpac,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
