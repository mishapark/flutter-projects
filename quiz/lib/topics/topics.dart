import 'package:flutter/material.dart';
import 'package:quizzapp/services/firestore.dart';
import 'package:quizzapp/shared/bottom_nav.dart';
import 'package:quizzapp/shared/error_message.dart';
import 'package:quizzapp/shared/loading.dart';
import 'package:quizzapp/topics/drawer.dart';
import 'package:quizzapp/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          final topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              primary: false,
              padding: const EdgeInsets.all(20),
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Text('No topics found. Check database');
        }
      },
    );
  }
}
