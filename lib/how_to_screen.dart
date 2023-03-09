import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HowToScreen extends StatelessWidget {
  const HowToScreen({super.key, required this.data, required this.date});

  final Map<String, dynamic> data;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How To'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                data['howto_title'],
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Answered on: $date',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
            ),
            Html(
              data: """
                ${data['howto_body']}
                """,
              style: {
                'p': Style(fontSize: FontSize.em(1.4)),
                'li': Style(fontSize: FontSize.em(1.2)),
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'By Team Flutter',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
