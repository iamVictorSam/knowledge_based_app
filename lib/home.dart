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
          "https://api.buttercms.com/v2/pages/knowledge_base/?auth_token=468dba86d8c24c33ee6b65bfb5939f1b91a75fab");
      final response = await http.get(url);
      if (response.statusCode == 200) {
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
                              Text(
                                data[0]['name'],
                                style: const TextStyle(
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
                                  // delegate to customize the search bar
                                  delegate: SearchScreen(
                                      data: data[0]['fields']['body']));
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
                          Text(
                            data[0]['fields']['title'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 84, 83, 83),
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ...List.generate(data[0]['fields']['body'].length,
                              (index) {
                            var resp = data[0]['fields']['body'][index];
                            String dateString = resp['answered_on'];
                            DateTime date = DateTime.parse(dateString);

                            return CustomCard(
                              resp: resp,
                              answeredBy: resp['answered_by'],
                              question: resp['question'],
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
