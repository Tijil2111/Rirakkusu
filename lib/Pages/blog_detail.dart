// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BlogsDetail extends StatefulWidget {
  final DocumentSnapshot post;

  BlogsDetail({required this.post});

  @override
  _BlogsDetailState createState() => _BlogsDetailState();
}

class _BlogsDetailState extends State<BlogsDetail> {
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: Image(
                      image: img(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: HexColor("#4166F5"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.post["title"],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#4166F5"),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Written By: ' + widget.post["name"],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 165,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 272, 0),
                child: Text(
                  'Tags: ' + widget.post["tags"],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  color: HexColor("#4166F5"),
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.post["description"],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
