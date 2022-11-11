import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketContainerWidget extends StatelessWidget {
  const TicketContainerWidget({
    Key? key,
    required this.venueName,
    required this.number,
    required this.image,
  }) : super(key: key);
  final String venueName;
  final String number;
  final String image;
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
      width: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topRight,
                scale: 4,
                image: AssetImage(
                  image,
                ),
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                venueName,
                style: GoogleFonts.raleway(
                    fontSize: 15, fontWeight: FontWeight.w800),
              ),
              Text(
                number,
                style: GoogleFonts.raleway(
                    fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
