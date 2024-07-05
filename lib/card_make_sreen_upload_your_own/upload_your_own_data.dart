import 'package:cloud_firestore/cloud_firestore.dart';

class UploadYourOwnData {
  final String image;

  UploadYourOwnData({
    required this.image,
  });

  factory UploadYourOwnData.fromSnapshot(DocumentSnapshot snapshot) {
    // Extract data from the snapshot
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UploadYourOwnData(
      image: data['image'],
    );
  }
}
