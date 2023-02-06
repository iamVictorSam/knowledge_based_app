import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HowToScreen extends StatelessWidget {
  const HowToScreen({super.key, required this.data});

  final Map<String, dynamic> data;

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
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                data['question'],
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Answered on: ${data['answered_on']}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            Html(
              data: """
                ${data['answer']}
                """,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Answered by: ${data['answered_by']}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
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
