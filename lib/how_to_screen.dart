import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HowToScreen extends StatelessWidget {
  const HowToScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final customDate = data['answered_on'].toString().substring(0, 10);

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
                data['question'],
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Answered on: $customDate',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
            ),
            Html(
              data: """
                ${data['answer']}
                """,
              style: {
                'p': Style(fontSize: FontSize.em(1.4)),
                'li': Style(fontSize: FontSize.em(1.2)),
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Answered by: ${data['answered_by']}',
              style: const TextStyle(
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
