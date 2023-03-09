import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:knowledge_based_app/custom_card.dart';
import 'package:knowledge_based_app/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];

  bool isLoading = true;

  Future retrieveHowTo() async {
    try {
      final url = Uri.parse(
          "https://api.buttercms.com/v2/pages/flutter_how_to/?auth_token=5b401ef0567ef2085368bf67a20bd1bd96c99098");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response);
        var result = jsonDecode(response.body);
        setState(() {
          data = result['data'] as List;
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
    retrieveHowTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCF7F8),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: data.isEmpty
                    ? const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'No Answers here',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded)),
                              const Text(
                                'How To',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate: SearchScreen(data: data));
                            },
                            child: const CircleAvatar(
                              radius: 55,
                              child: Icon(
                                Icons.search,
                                size: 70,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 5),
                          const Text(
                            'Frequently asked How To(s) in Flutter',
                            style: TextStyle(
                              color: Color.fromARGB(255, 84, 83, 83),
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ...List.generate(data.length, (index) {
                            var resp = data[index]['fields'];
                            print(resp);
                            String dateString = data[index]['updated'];
                            DateTime date = DateTime.parse(dateString);
                            print(date);

                            return CustomCard(
                              resp: resp,
                              question: resp['howto_title'],
                              date: date,
                            );
                          })
                        ],
                      ),
              ),
            ),
    );
  }
}
