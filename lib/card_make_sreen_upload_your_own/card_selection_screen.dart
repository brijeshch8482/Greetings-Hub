import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invitation_card_maker/card_make_sreen_upload_your_own/upload_your_own_data.dart';

class CardSelectionScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'CardSelectionScreen';
  const CardSelectionScreen({super.key, this.title,});

  final title;

  @override
  State<CardSelectionScreen> createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF109D92),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('UploadYourOwnSelection').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final List<UploadYourOwnData> data = snapshot.data!.docs.map((doc) => UploadYourOwnData.fromSnapshot(doc)).toList();
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    // No need to set childAspectRatio here
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    // Define a function to calculate aspect ratio based on index
                    double calculateAspectRatio(int index) {
                      if (index == 1) {
                        print("index 1");
                        return 4 / 9; // Change aspect ratio for item at index 1
                      } else {
                        print("index other than 1");
                        return 5 / 7; // Default aspect ratio
                      }
                    }

                    return AspectRatio(
                      aspectRatio: calculateAspectRatio(index),
                      child: Material(
                        elevation: 4,
                        child: Image.network(
                          data[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                );







              }
            },
          ),
        )
        ),
      );
  }
}
