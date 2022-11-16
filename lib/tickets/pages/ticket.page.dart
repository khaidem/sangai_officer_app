import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);
  static const routeName = '/TicketPage';

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final ref = FirebaseDatabase.instance.ref().child('tickets');
  // List dateTime = ['2022-11-01', '2022-11-02'];
  List ticketSold = [];
  List dateKey = [];
  String ticket1 = '';
  String ticket2 = '';
  String ticket3 = '';
  String visitor1 = '';
  String visitor2 = '';
  String visitor3 = '';
  @override
  void initState() {
    super.initState();
    ref.onValue.listen((dataValue) {
      final data = Map<String, dynamic>.from(
        dataValue.snapshot.value as Map,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        ticket1 = data['sold_e_1'].toString();
        ticket2 = data['sold_e_2'].toString();
        ticket3 = data['sold_e_3'].toString();
        visitor1 = data['checked_1'].toString();
        visitor2 = data['checked_2'].toString();
        visitor3 = data['checked_3'].toString();
      });
      // log(ticketSold.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ref.onValue,
        builder: (context, snap) {
          if (snap.hasData) {
            log(snap.data!.snapshot.value.toString());
            
            return ListView.builder(
              shrinkWrap: true,
              itemCount: ,
              itemBuilder: (BuildContext context, int index) {
                return Text();
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
