import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../model_class/invitations_card_data.dart';
import '../services/helper.dart';


class SubCategorySelectionChangeNotifier extends ChangeNotifier  {

  List<String> subCategorySelectionButtonTextList = <String>[];
  List<String> gridViewCardsImagePathList = [];
  final db = FirebaseFirestore.instance;

  void initializeSubCategorySelectionButtonTextList({String listTitle = ''}) {
    switch (listTitle) {
      case 'Wedding':
        {
          subCategorySelectionButtonTextList = <String>[
            'Wedding Invitations',
            'Bridal Shower',
            'Bachelor Party',
            'Save The Date',
            'Engagement Party',
            'Rehearsal Dinner',
            'RSVP Cards',
          ];
          break;
        }
      case 'Birthday':
        {
          subCategorySelectionButtonTextList = <String>[
            '1st Birthday',
            'Baby Birthday',
            'Kids Birthday',
            'Men\'s Birthday',
            'Women\'s Birthday',
          ];
          break;
        }
      case 'Party':
        {
          subCategorySelectionButtonTextList = <String>[
            'Anniversary',
            'BBQ Party',
            'Christmas Party',
            'Cocktail Party',
            'Dinner Party',
            'Family Reunion',
            'Graduation Party',
            'Housewarming',
            'Retirement Party',
            'Happy New Year',
            'Sleepover Party',
            'Sports & Games',
            'Summer & Pool',
            'Professional Events',
          ];
          break;
        }
      case 'Babies & Kids':
        {
          subCategorySelectionButtonTextList = <String>[
            '1st Birthday',
            'Birth Announcements',
            'Baby Birthday',
            'Baby Shower',
            'Baby Sprinkle',
            'Baptism & Christening',
            'First Communion',
            'Gender Reveal',
            'Kids Birthday',
            'Sip & See',
          ];
          break;
        }
      case 'Announcements':
        {
          subCategorySelectionButtonTextList = <String>[
            'Birth',
            'Engagement',
            'Graduation',
            'Memorial',
            'Moving',
            'Pregnancy',
            'Save the date',
            'Wedding',
          ];
          break;
        }
      default :{
        subCategorySelectionButtonTextList = <String>[];
        break;
      }
    }
  }

  void selectCardCollectionList({String completeCategory = ''}) async {
    gridViewCardsImagePathList.clear();
    switch(completeCategory) {
      case 'Wedding_Wedding Invitations': {

        break;
      }

      case 'Wedding_Bridal Shower': {
        break;
      }

      case 'Wedding_Engagement Party': {
        break;
      }

      case 'Wedding_Bachelor Party': {

        break;
      }

      case 'Wedding_Rehearsal Dinner': {

        break;
      }

      case 'Wedding_Save The Date': {

        break;
      }

      case 'Birthday_1st Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/birthday/first_birthday/birthday_first_birthday_one.png',
          'assets/images/birthday/first_birthday/birthday_first_birthday_two.png',
          'assets/images/birthday/first_birthday/birthday_first_birthday_three.png',
        ];
        break;
      }

      case 'Birthday_Baby Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/birthday/baby_birthday/birthday_baby_birthday_one.png',
          'assets/images/birthday/baby_birthday/birthday_baby_birthday_two.png',
        ];
        break;
      }

      case 'Birthday_Kids Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/birthday/kids_birthday/birthday_kids_birthday_one.png',
          'assets/images/birthday/kids_birthday/birthday_kids_birthday_two.png',
          'assets/images/birthday/kids_birthday/birthday_kids_birthday_three.png',
        ];
        break;
      }

      case 'Birthday_Men\'s Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/birthday/mens_birthday/birthday_men_birthday_one.png',
          'assets/images/birthday/mens_birthday/birthday_men_birthday_two.png',
        ];
        break;
      }

      case 'Birthday_Women\'s Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/birthday/womens_birthday/birthday_women_birthday_one.png',
          'assets/images/birthday/womens_birthday/birthday_women_birthday_two.png',
          'assets/images/birthday/womens_birthday/birthday_women_birthday_three.png',
        ];
        break;
      }

      case 'Party_Anniversary': {
        gridViewCardsImagePathList = [
          'assets/images/party/anniversary/party_anniversary_one.png',
          'assets/images/party/anniversary/party_anniversary_two.png',
          'assets/images/party/anniversary/party_anniversary_three.png',
        ];
        break;
      }

      case 'Party_BBQ Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/bbq_party/party_bbq_party_one.png',
          'assets/images/party/bbq_party/party_bbq_party_two.png',
        ];
        break;
      }

      case 'Party_Christmas Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/christmas_party/party_christmas_party_one.png',
          'assets/images/party/christmas_party/party_christmas_party_two.png',
          'assets/images/party/christmas_party/party_christmas_party_three.png',
          'assets/images/party/christmas_party/party_christmas_party_four.png',
        ];
        break;
      }

      case 'Party_Cocktail Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/cocktail_party/party_cocktail_party_one.png',
          'assets/images/party/cocktail_party/party_cocktail_party_two.png',
          'assets/images/party/cocktail_party/party_cocktail_party_three.png',
          'assets/images/party/cocktail_party/party_cocktail_party_four.png',
        ];
        break;
      }

      case 'Party_Dinner Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/dinner_party/party_dinner_party_one.png',
          'assets/images/party/dinner_party/party_dinner_party_two.png',
          'assets/images/party/dinner_party/party_dinner_party_three.png',
          'assets/images/party/dinner_party/party_dinner_party_four.png',
          'assets/images/party/dinner_party/party_dinner_party_five.png',
        ];
        break;
      }

      case 'Party_Family Reunion': {
        gridViewCardsImagePathList = [
          'assets/images/party/family_reunion/party_family_reunion_one.png',
          'assets/images/party/family_reunion/party_family_reunion_two.png',
          'assets/images/party/family_reunion/party_family_reunion_three.png',
        ];
        break;
      }

      case 'Party_Graduation Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/graduation_party/party_graduation_party_one.png',
          'assets/images/party/graduation_party/party_graduation_party_two.png',
          'assets/images/party/graduation_party/party_graduation_party_three.png',
        ];
        break;
      }

      case 'Party_Happy New Year': {
        gridViewCardsImagePathList = [
          'assets/images/party/happy_new_year/party_happy_new_year_one.png',
          'assets/images/party/happy_new_year/party_happy_new_year_two.png',
        ];
        break;
      }

      case 'Party_Housewarming': {
        gridViewCardsImagePathList = [
          'assets/images/party/house_warming/party_house_warming_one.png',
          'assets/images/party/house_warming/party_house_warming_two.png',
          'assets/images/party/house_warming/party_house_warming_three.png',
        ];
        break;
      }

      case 'Party_Retirement Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/retirement_party/party_retirement_party_one.png',
          'assets/images/party/retirement_party/party_retirement_party_two.png',
        ];
        break;
      }

      case 'Party_Sleepover Party': {
        gridViewCardsImagePathList = [
          'assets/images/party/sleepover_party/party_sleepover_party_one.png',
          'assets/images/party/sleepover_party/party_sleepover_party_two.png',
        ];
        break;
      }

      case 'Party_Summer & Pool': {
        gridViewCardsImagePathList = [
          'assets/images/party/summer_and_pool/party_summer_and_pool_one.png',
          'assets/images/party/summer_and_pool/party_summer_and_pool_two.png',
          'assets/images/party/summer_and_pool/party_summer_and_pool_three.png',
          'assets/images/party/summer_and_pool/party_summer_and_pool_four.png',
        ];
        break;
      }

      case 'Announcements_Birth': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/birth/announcements_birth_one.png',
          'assets/images/announcements/birth/announcements_birth_two.png',
        ];
        break;
      }

      case 'Announcements_Engagement': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/engagement/announcements_engagement_one.png',
          'assets/images/announcements/engagement/announcements_engagement_two.png',
          'assets/images/announcements/engagement/announcements_engagement_three.png',
        ];
        break;
      }

      case 'Announcements_Graduation': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/graduation/announcements_graduation_one.png',
          'assets/images/announcements/graduation/announcements_graduation_two.png',
          'assets/images/announcements/graduation/announcements_graduation_three.png',
        ];
        break;
      }

      case 'Announcements_Memorial': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/memorial/announcements_memorial_one.png',
          'assets/images/announcements/memorial/announcements_memorial_two.png',
        ];
        break;
      }

      case 'Announcements_Moving': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/moving/announcements_moving_one.png',
          'assets/images/announcements/moving/announcements_moving_two.png',
        ];
        break;
      }

      case 'Announcements_Pregnancy': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/pregnancy/announcements_pregnancy_one.png',
          'assets/images/announcements/pregnancy/announcements_pregnancy_two.png',
        ];
        break;
      }

      case 'Announcements_Save the date': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/save_the_date/announcements_save_the_date_one.png',
          'assets/images/announcements/save_the_date/announcements_save_the_date_two.png',
          'assets/images/announcements/save_the_date/announcements_save_the_date_three.png',
        ];
        break;
      }

      case 'Announcements_Wedding': {
        gridViewCardsImagePathList = [
          'assets/images/announcements/wedding/announcements_wedding_one.png',
          'assets/images/announcements/wedding/announcements_wedding_two.png',
          'assets/images/announcements/wedding/announcements_wedding_three.png',
        ];
        break;
      }

      case 'Babies & Kids_1st Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/first_birthday/babies_and_kids_first_birthday_one.png',
          'assets/images/babies_and_kids/first_birthday/babies_and_kids_first_birthday_two.png',
        ];
        break;
      }

      case 'Babies & Kids_Baby Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/baby_birthday/babies_and_kids_baby_birthday_one.png',
        ];
        break;
      }

      case 'Babies & Kids_Baby Shower': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/baby_shower/babies_and_kids_baby_shower_one.png',
          'assets/images/babies_and_kids/baby_shower/babies_and_kids_baby_shower_two.png',
          'assets/images/babies_and_kids/baby_shower/babies_and_kids_baby_shower_three.png',
        ];
        break;
      }

      case 'Babies & Kids_Baby Sprinkle': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/baby_sprinkle/babies_and_kids_baby_sprinkle_one.png',
          'assets/images/babies_and_kids/baby_sprinkle/babies_and_kids_baby_sprinkle_two.png',
          'assets/images/babies_and_kids/baby_sprinkle/babies_and_kids_baby_sprinkle_three.png',
        ];
        break;
      }

      case 'Babies & Kids_Baptism & Christening': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/baptism_and_christening/babies_and_kids_baptism_and_christening_one.png',
          'assets/images/babies_and_kids/baptism_and_christening/babies_and_kids_baptism_and_christening_two.png',
        ];
        break;
      }

      case 'Babies & Kids_First Communion': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/first_communion/babies_and_kids_first_communion_one.png',
          'assets/images/babies_and_kids/first_communion/babies_and_kids_first_communion_two.png',
          'assets/images/babies_and_kids/first_communion/babies_and_kids_first_communion_three.png',
        ];
        break;
      }

      case 'Babies & Kids_Gender Reveal': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/gender_reveal/babies_and_kids_gender_reveal_one.png',
          'assets/images/babies_and_kids/gender_reveal/babies_and_kids_gender_reveal_two.png',
          'assets/images/babies_and_kids/gender_reveal/babies_and_kids_gender_reveal_three.png',
        ];
        break;
      }

      case 'Babies & Kids_Kids Birthday': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/kids_birthday/babies_and_kids_kids_birthday_one.png',
        ];
        break;
      }

      case 'Babies & Kids_Sip & See': {
        gridViewCardsImagePathList = [
          'assets/images/babies_and_kids/sip_and_see/babies_and_kids_sip_and_see_one.png',
          'assets/images/babies_and_kids/sip_and_see/babies_and_kids_sip_and_see_two.png',
          'assets/images/babies_and_kids/sip_and_see/babies_and_kids_sip_and_see_three.png',
        ];
        break;
      }

      default : {
        gridViewCardsImagePathList = [
          'assets/images/no_data_found/no_data_found.png',
        ];
        break;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

mixin class SubCategoryImage{

  Future<List<dynamic>> getSubCategoryImage({required String title, required String completeCategory}) async {
    List<dynamic> dataList = [];
    String cardCollection = "${title.replaceAll(' ', '')}ImageWithText";

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection(cardCollection)
        .doc(completeCategory)
        .collection("ImageData")
        .get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot in querySnapshot.docs) {
      switch (title) {
        case 'Birthday':
          BirthdayInvitationsCardData data = BirthdayInvitationsCardData.fromDocumentSnapshot(documentSnapshot);
          dataList.add(data);
          break;
        case 'Wedding':
          WeddingInvitationCardData data = WeddingInvitationCardData.fromDocumentSnapshot(documentSnapshot);
          dataList.add(data);
          break;
      // Add additional cases for other titles if needed
        default:
          throw Exception('Unknown title: $title');
      }
    }

    return dataList;
  }


}