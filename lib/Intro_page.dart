import 'package:flutter/material.dart';
import 'package:knowledge_based_app/home.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                image: DecorationImage(
                  image: const NetworkImage(
                      'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.darken),
                )),
            child: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: FlutterLogo(
                    size: 40,
                  ),
                  title: Text(
                    'Flutter',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Spacer(),
                Center(
                  child: Text(
                    'Answers to your most common Flutter\n questions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Get the most out of Flutter',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Articles to help get you started with Flutter: How To\'s,  Modeling Basics, FAQs, and more..',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  )),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    children: [
                      Row(children: const [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 48,
                          child: FlutterLogo(
                            size: 48,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'How To\'s',
                          style: TextStyle(color: Colors.black87, fontSize: 30),
                        ),
                      ]),
                      const SizedBox(height: 20),
                      const Text(
                        'How to use the Flutter cli to install packages, use packages, write efficient flutter codes ... and more!',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
