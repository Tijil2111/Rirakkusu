// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reduceo/Pages/blog_detail.dart';
import 'package:reduceo/shared/loading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  Future getPosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection('stories').get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogsDetail(post: post),
      ),
    );
  }

  final dynamic listBg = [
    'https://images.unsplash.com/photo-1600356604120-a282718b29b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2338&q=80',
    'https://media.istockphoto.com/photos/close-up-of-small-blue-gray-mobile-home-with-a-front-and-side-porch-picture-id1297687835?s=612x612',
    'https://images.unsplash.com/photo-1587731556938-38755b4803a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2356&q=80',
    'https://images.unsplash.com/photo-1588629424594-b3a76a97fb73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
  ];

  final _formKey = GlobalKey<FormState>();
  final Random rnd = Random();
  NetworkImage img() {
    int min = 0;
    int max = listBg.length - 1;
    int r = min + rnd.nextInt(max - min);
    String imageName = listBg[r].toString();
    return NetworkImage(imageName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
              future: getPosts(),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Loading(),
                  );
                } else {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      title: Text(
                        'Stories',
                        style: TextStyle(
                            color: HexColor("#80E7FA"),
                            fontWeight: FontWeight.bold),
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
                            color: HexColor("#80E7FA"),
                            size: 16,
                          )),
                    ),
                    body: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: img(),
                                                fit: BoxFit.cover),
                                          ),
                                          height: 140,
                                          child: InkWell(
                                            child: Center(
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 30.0),
                                                      child: Text(
                                                        snapshot.data[index]
                                                            ['title'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: HexColor(
                                                              "#80E7FA"),
                                                          fontSize: 23,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 30.0),
                                                      child: Text(
                                                        'Written By -' +
                                                            snapshot.data[index]
                                                                ['name'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () => navigateToDetail(
                                                snapshot.data[index]),
                                          )),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  );
                }
              })),
    );
  }
}
