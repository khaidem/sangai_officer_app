import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketContainerSoldWidget extends StatelessWidget {
  const TicketContainerSoldWidget({
    Key? key,
    required this.venueName,
    required this.number,
    required this.ticketSold,
  }) : super(key: key);
  final String venueName;
  final String number;
  final String ticketSold;
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
          Radius.circular(15),
        ),
      ),

      // height: 100,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   alignment: Alignment.topRight,
            //   scale: 4,
            //   image: AssetImage(
            //     KImage.ticketsLowOpac,
            //   ),
            // ),
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                venueName,
                style: GoogleFonts.raleway(
                    fontSize: 12, fontWeight: FontWeight.w800),
              ),
              Text(
                number,
                style: GoogleFonts.raleway(
                    fontSize: 25, fontWeight: FontWeight.w900),
              ),
              // getSize(0, 10),
              Text(
                ticketSold,
                style: GoogleFonts.raleway(
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
