import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invitation_card_maker/model_class/home_page_data.dart';

class Helper {
  Future<List<InvitationsHomeData>> getInvitationsHomeData() async {
    final db = FirebaseFirestore.instance;
    List<InvitationsHomeData> homeDataList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
          .collection("InvitationHomeCard")
          .orderBy("id",
              descending: false) // Use 'descending: false' for ascending order
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        InvitationsHomeData homeData =
            InvitationsHomeData.fromJson(document.data());
        homeDataList.add(homeData);
      }

      return homeDataList;
    } catch (e) {
      print("Error fetching invitations home data: $e");
      return [];
    }
  }

  Future<List<String>> weddingInvitations(String completeCategory) async {
    final db = FirebaseFirestore.instance;

    try {
      DocumentSnapshot snapshot = await db
          .collection("WeddingImageWithText")
          .doc(completeCategory)
          .get();

      if (snapshot.exists) {
        // Access the 'images' array
        List<String> images = List<String>.from(snapshot.get('images'));
        return images;
      } else {
        print('Document does not exist');
        return [];
      }
    } catch (e) {
      print('Error retrieving data: $e');
      return [];
    }
  }
}
