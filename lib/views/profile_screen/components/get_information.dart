import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tsec_hack/consts/colors.dart';
import 'package:tsec_hack/consts/firebase_const.dart';
import 'package:tsec_hack/services/firestore_services.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text(
            'My Information',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              print(data);
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    _buildInfoCard('Name', data['name']),
                    _buildInfoCard('Email', data['email']),
                    _buildInfoCard('Location', data['location']),
                    _buildListCard('Languages',
                        [data['language'][0], data['language'][1]]),
                    _buildInfoCard(
                        'Disabled Inclusive', data['disabled_inclusive']),
                    _buildListCard(
                        'Skills', [data['skills'][0], data['skills'][1]]),
                    _buildInfoCard('Post', data['post']),
                    _buildListCard(
                        'Perks', [data['perks'][0], data['perks'][1]]),
                  ],
                ),
              );
            }
          },
        ));
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      elevation: 3,
      color: Colors.blue,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: whiteColor),
        ),
      ),
    );
  }

  Widget _buildListCard(String label, List<String> values) {
    return Card(
      color: Colors.blue,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values
              .asMap()
              .entries
              .map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    '- ${entry.value}',
                    style: const TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
