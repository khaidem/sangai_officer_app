import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/text_style.dart';

class RowVisitorWidget extends StatelessWidget {
  const RowVisitorWidget({
    Key? key,
    required this.dayName,
    required this.date,
  }) : super(key: key);
  final String dayName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule),
        getSize(0, 10),
        Text(
          dayName,
          style: GoogleFonts.raleway(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          date,
          style: GoogleFonts.raleway(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
