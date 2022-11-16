import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sangai_officer_app/tickets/example.dart';

import '../../core/constant.dart';
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
    // return Scaffold(
    //   body: Builder(
    //     builder: (BuildContext) {
    //       late DatabaseReference dbref;
    //       dbref = FirebaseDatabase.instance.ref("tickets");
    //       List dateList = [];
    //       List ticketSold1E = [];
    //       List ticketSold2E = [];
    //       List ticketSold3E = [];
    //       List ticketSold1P = [];
    //       List ticketSold2P = [];
    //       List ticketSold3P = [];
    //       List checked1 = [];
    //       List checked2 = [];
    //       List checked3 = [];
    //       List sdetails = [];

    //       return StreamBuilder(
    //         stream: dbref.onValue,
    //         builder: (context, snapshot) {
    //           List messageList = [];
    //           if (snapshot.hasData &&
    //               snapshot.data != null &&
    //               (snapshot.data!).snapshot.value != null) {
    //             final myMessages = Map<dynamic, dynamic>.from(
    //                 (snapshot.data!).snapshot.value as Map<dynamic, dynamic>);
    //             dateList = [];
    //             ticketSold1E = [];
    //             ticketSold2E = [];
    //             ticketSold3E = [];
    //             ticketSold1P = [];
    //             ticketSold2P = [];
    //             ticketSold3P = [];
    //             checked1 = [];
    //             checked2 = [];
    //             checked3 = [];

    //             myMessages.forEach((key, value) {
    //               dateList.add(key);
    //               ticketSold1E.add(myMessages[key]["sold_e_1"]); //get logo
    //             });

    //             return ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: dateList.length,
    //               itemBuilder: (context, int index) {
    //                 return Container(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: GestureDetector(
    //                     onTap: () {},
    //                     child: Card(
    //                         child: ListTile(
    //                       leading: Text(dateList[index]),
    //                       trailing: Text(ticketSold1E[index].toString()),
    //                     )),
    //                   ),
    //                 );
    //               },
    //             );
    //           } else {
    //             return const Center(
    //               child: CircularProgressIndicator(
    //                 color: Colors.amber,
    //               ),
    //             );
    //           }
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}


// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class TicketPage extends StatefulWidget {
//   const TicketPage({Key? key}) : super(key: key);
//   static const routeName = '/TicketPage';

//   @override
//   State<TicketPage> createState() => _TicketPageState();
// }

// class _TicketPageState extends State<TicketPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(
//         builder: (BuildContext) {
//           late DatabaseReference _dbref;
//           _dbref = FirebaseDatabase.instance.ref("tickets");
//           List dateList = [];
//           List ticketSold1_e = [];
//           List ticketSold2_e = [];
//           List ticketSold3_e = [];   
//           List ticketSold1_p = [];
//           List ticketSold2_p = [];
//           List ticketSold3_p = [];
//           List checked1 = [];
//           List checked2 = [];
//           List checked3 = [];
//           List sdetails = [];

//           return StreamBuilder(
//             stream: _dbref.onValue,
//             builder: (context, snapshot) {
//               List messageList = [];
//               if (snapshot.hasData &&
//                   snapshot.data != null &&
//                   (snapshot.data! as DatabaseEvent).snapshot.value != null) {
//                 final myMessages = Map<dynamic, dynamic>.from(
//                     (snapshot.data! as DatabaseEvent).snapshot.value
//                         as Map<dynamic, dynamic>);
//                 dateList = [];
//                 ticketSold1_e = [];
//                 ticketSold2_e = [];
//                 ticketSold3_e = [];
//                 ticketSold1_p = [];
//                 ticketSold2_p = [];
//                 ticketSold3_p = [];
//                 checked1 = [];
//                 checked2 = [];
//                 checked3 = [];
                

//                 myMessages.forEach((key, value) {
//                   dateList.add(key);
//                   ticketSold1_e.add(myMessages[key]["sold_e_1"]); //get logo
//                 });
             

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: dateList.length,
//                   itemBuilder: (context, int index) {
//                     return Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: Card(
//                             child: ListTile(
//                           leading: Text(dateList[index]),
//                           trailing: Text(ticketSold1[index].toString()),
//                         )),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.amber,
//                   ),
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }