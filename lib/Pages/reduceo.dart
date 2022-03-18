// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reduceo/bottomSheets/meditation.dart';
import 'package:reduceo/bottomSheets/notification.dart';
import 'package:reduceo/shared/loading-quote.dart';

class ReduceoPage extends StatefulWidget {
  const ReduceoPage({Key? key}) : super(key: key);

  @override
  State<ReduceoPage> createState() => _ReduceoPageState();
}

class _ReduceoPageState extends State<ReduceoPage> {
  Future getQuotes() async {
    var database = FirebaseFirestore.instance;
    QuerySnapshot qn = await database.collection('quote-list').get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reducing Mental Problems',
          style: TextStyle(
              color: HexColor("#4166F5"), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/main');
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: HexColor("#4166F5"),
              size: 16,
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getQuotes(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingQuote(),
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 700,
                                  child: const MeditationBottom(),
                                );
                              });
                        },
                        child: Container(
                          height: 130,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 3,
                            color: HexColor("#4166F5"),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Start Meditation',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Text(
                                  'Meditation is the best solution to most of your inner problems.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 700,
                                  child: const NotificationSetter(),
                                );
                              });
                        },
                        child: Container(
                          height: 130,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 3,
                            color: HexColor("#4166F5"),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Schedule your meditation',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Text(
                                  'Busy right now ? We can schedule a meditation session for you ! ',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/blogs');
                            },
                            child: Container(
                              height: 130,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 3,
                                color: HexColor("#F7FDFF"),
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Hear tips from experts',
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Experts are writing their blogs !',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        'Not Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#4166F5"),
                                        ),
                                      ),
                                      content: Text(
                                        'Currently in development',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#4166F5"),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 130,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 3,
                                  color: HexColor("#F6FDF8"),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        'Mood Checker !',
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Check Your Mood ! ',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            flex: 2),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Divider(
                      thickness: 5,
                      color: HexColor('#4166F5'),
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Quotes ',
                      style: TextStyle(
                        color: HexColor('#4166F5'),
                        fontSize: 20,
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: HexColor("#4166F5"),
                                  ),
                                ),
                                child: Text(
                                  snapshot.data[index]['quote'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: HexColor("#4166F5"),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
