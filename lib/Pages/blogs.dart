// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reduceo/Pages/blog_detail.dart';
import 'package:reduceo/shared/loading.dart';

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
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 100,
                            child: ListTile(
                              title: Text(
                                snapshot.data[index]['title'],
                                style: const TextStyle(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              subtitle: Text(
                                'Written By: ' + snapshot.data[index]['name'],
                              ),
                              onTap: () =>
                                  navigateToDetail(snapshot.data[index]),
                            ),
                          ),
                        );
                      });
                }
              })),
    );
  }
}
