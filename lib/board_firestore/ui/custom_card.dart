import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
        data['timeStamp'].seconds * 1000);
    var dateFormatted = new DateFormat('EEE, MMM d, y').format(timeToDate);
    return Column(
      children: [
        Container(
          height: 150,
          child: Card(
            elevation: 9,
            child: Column(
              children: [
                ListTile(
                  title: Text(data['title']),
                  subtitle: Text(data['description']),
                  leading: CircleAvatar(
                      radius: 34, child: Text(data['title'].toString()[0])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('By:   ${data['name']}'),
                      Text((dateFormatted == null) ? 'N/A' : dateFormatted),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
