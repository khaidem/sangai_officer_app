import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sangai_officer_app/tickets/example.dart';
import 'package:sangai_officer_app/tickets/widgets/ticket_container.widget.dart';

import '../../core/constant.dart';
import '../../core/text_style.dart';
import '../../core/widget/text_gradient.widget.dart';

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
      if (!mounted) {
        return;
      }
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
        padding: const EdgeInsets.all(43),
        child: Column(
          children: [
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
                  height: 100,
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
                        ContainerSoldWidget(
                            venueName: 'Hapta kangjeibung',
                            Enumber: t['sold_e_1'].toString(),
                            Pnumber: t['sold_p_1'].toString()),
                        getSize(10, 0),
                        ContainerSoldWidget(
                            venueName: 'Moirng khunou',
                            Enumber: t['sold_e_2'].toString(),
                            Pnumber: t['sold_p_2'].toString()),
                        getSize(10, 0),
                        ContainerSoldWidget(
                          venueName: 'Marjing',
                          Enumber: t['sold_e_3'].toString(),
                          Pnumber: t['sold_p_3'].toString(),
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
