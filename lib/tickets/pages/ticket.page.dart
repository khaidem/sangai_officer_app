import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../../core/widget/text_gradient.widget.dart';
import '../widgets/row_sold.widget.dart';
import '../widgets/ticket_container_sold.widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);
  static const routeName = '/TicketPage';

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final ref = FirebaseDatabase.instance.ref();
  Map<String, dynamic> data = {};
  List<String> keys = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    ref.child("tickets").onValue.listen((event) {
      var res = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );
      var k = res.keys.map((e) {
        return e.toString();
      }).toList();
      k.remove("total");
      k.sort();

      setState(() {
        data = res;
        keys = k;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Ticket",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: keys.length,
              itemBuilder: (context, index) {
                var t = data[keys[index]];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowSoldWidget(
                          dayName: "Day ${index + 1}", date: keys[index]),
                    ),
                    // Text(data[keys[index]].toString())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TicketContainerSoldWidget(
                                number: t['checked_1'].toString(),
                                ticketSold: "Ticket Sold",
                                venueName: 'Hapta',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TicketContainerSoldWidget(
                                number: t['checked_2'].toString(),
                                ticketSold: "Ticket Sold",
                                venueName: 'Moirang',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TicketContainerSoldWidget(
                          number: t['checked_3'].toString(),
                          ticketSold: "Ticket Sold",
                          venueName: 'Marjing',
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
