import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerSoldWidget extends StatelessWidget {
  const ContainerSoldWidget({
    Key? key,
    required this.venueName,
    required this.Enumber,
    required this.Pnumber,
  }) : super(key: key);
  final String venueName;
  final String Enumber;
  final String Pnumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xfff45b69),
            Color(0xffffbc11),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   alignment: Alignment.topRight,
              //   scale: 4,
              //   image: AssetImage(
              //     image,
              //   ),
              // ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    venueName,
                    style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Enumber,
                            style: GoogleFonts.raleway(
                                fontSize: 35, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'E-Tickets',
                            style: GoogleFonts.raleway(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Pnumber,
                            style: GoogleFonts.raleway(
                                fontSize: 35, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'Paper Tickets',
                            style: GoogleFonts.raleway(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       Enumber,
              //       style: GoogleFonts.raleway(
              //           fontSize: 35, fontWeight: FontWeight.w900),
              //     ),
              //     Text(
              //       Pnumber,
              //       style: GoogleFonts.raleway(
              //           fontSize: 35, fontWeight: FontWeight.w900),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'E-Tickets',
              //       style: GoogleFonts.raleway(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w800,
              //           color: Colors.grey),
              //     ),
              //     Text(
              //       'Paper Tickets',
              //       style: GoogleFonts.raleway(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w800,
              //           color: Colors.grey),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
