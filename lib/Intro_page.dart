import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:knowledge_based_app/home.dart';
import 'package:http/http.dart' as http;

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List data = [];

  bool isLoading = true;

  Future retrieveIntroPage() async {
    try {
      final url = Uri.parse(
          "https://api.buttercms.com/v2/pages/home_page/?auth_token=5b401ef0567ef2085368bf67a20bd1bd96c99098");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        setState(() {
          data = result['data'];
          isLoading = false;
        });
        return result;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveIntroPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      image: DecorationImage(
                        image: NetworkImage(data[0]['fields']['hero_image']),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.darken),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const ListTile(
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Text(
                            data[0]['fields']['hero_title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  data[0]['fields']['section_title'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    data[0]['fields']['section_desc'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ...List.generate(
                  data[0]['fields']['contents'].length,
                  (index) => Padding(
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
                              Row(children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage: NetworkImage(data[0]
                                          ['fields']['contents'][index]
                                      ['content_logo']),
                                  radius: 48,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  data[0]['fields']['contents'][index]
                                      ['content_title'],
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 30),
                                ),
                              ]),
                              const SizedBox(height: 20),
                              Text(
                                data[0]['fields']['contents'][index]
                                    ['content_desc'],
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
