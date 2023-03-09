import 'package:flutter/material.dart';
import 'how_to_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.date,
    required this.question,
    this.resp,
  }) : super(key: key);

  final String question;
  final DateTime? date;
  final resp;

  @override
  Widget build(BuildContext context) {
    final customDate = date.toString().substring(0, 10);
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HowToScreen(
                    data: resp,
                    date: customDate,
                  ))),
      child: Card(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'On $customDate',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              trailing: const Text(
                'By: Team Flutter',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 20,
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
