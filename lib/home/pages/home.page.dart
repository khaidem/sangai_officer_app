import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangai_officer_app/core/constant.dart';
import 'package:sangai_officer_app/core/text_style.dart';
import 'package:sangai_officer_app/home/widgets/widgets.dart';

import '../../core/widget/icon_gradient.widget.dart';
import '../../core/widget/text_gradient.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        'Report',
                        gradient: LinearGradient(colors: [
                          Color(0xfff45b69),
                          Color(0xffffbc11),
                        ]),
                        fontSize: 30,
                      ),
                    ],
                  ),
                  getSize(20, 0),
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
          ],
        ),
      ),
    );
  }
}
