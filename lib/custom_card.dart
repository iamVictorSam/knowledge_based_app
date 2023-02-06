import 'package:flutter/material.dart';

import 'how_to_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.date,
    required this.answeredBy,
    required this.question,
    this.resp,
  }) : super(key: key);

  final String answeredBy, question;
  final DateTime date;
  final resp;

  @override
  Widget build(BuildContext context) {
    final customDate = date.toString().substring(0, 10);
    return Card(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[350]!)),
        child: Column(
          children: [
            Container(
              height: 180,
              width: 120,
              decoration: const BoxDecoration(),
              child: const FlutterLogo(),
            ),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HowToScreen(data: resp))),
              title: Text(
                'On: $customDate',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              trailing: Text(
                'By: $answeredBy',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              isThreeLine: true,
              subtitle: Text(
                question,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xffFCF7F8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
