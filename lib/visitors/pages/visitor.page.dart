import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sangai_officer_app/tickets/widgets/widgets.dart';

import '../../core/core.dart';
import '../../core/widget/text_gradient.widget.dart';
import '../../home/widgets/ticket_conatiner.widget.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({Key? key}) : super(key: key);
  static const routName = '/VisitorPage';

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfff45b69),
                        Color(0xffffbc11),
                      ],
                    ),
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
                          TicketContainerWidget(
                              venueName: "Hapta kangjeibung",
                              number: t['checked_1'].toString(),
                              image: KImage.visitorLowOpac),
                          getSize(10, 0),
                          TicketContainerWidget(
                              venueName: "Moirng",
                              number: t['checked_2'].toString(),
                              image: KImage.visitorLowOpac),
                          getSize(10, 0),
                          TicketContainerWidget(
                              venueName: "Marjing",
                              number: t['checked_3'].toString(),
                              image: KImage.visitorLowOpac),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
