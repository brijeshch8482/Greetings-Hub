import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invitation_card_maker/data_collection/data_collection_behavior.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import '../card_customization_screen/card_customization_behavior.dart';
import '../card_customization_screen/card_customization_ui.dart';
import '../constants.dart';
import '../home_screen/home_behavior.dart';
import '../services/store_card_data.dart';
import 'data_collection_portion_provider.dart';

class DataCollection extends StatefulWidget {
  const DataCollection({Key? key,required this.subCategoryCardData}) : super(key: key);

  static const String ROUTE_NAME = 'DataCollection';
  final dynamic subCategoryCardData;

  @override
  State<DataCollection> createState() => _DataCollectionState();
}

class _DataCollectionState extends State<DataCollection> with HomeScreenBehavior, DataCollectionBehavior, TickerProviderStateMixin{

  void initializeHintTextList({String categoryTitle = ''}) {
    switch (categoryTitle) {
      case 'Wedding':
        {
          initializeWeddingHintTextList(
              weddingSubCategoryTitle: subCategoryTitle);
          break;
        }
      case 'Birthday':
        {
          initializeBirthdayHintTextList(
              birthdaySubCategoryTitle: subCategoryTitle);
          break;
        }
      case 'Party':
        {
          initializePartyHintTextList(
              partySubCategoryTitle: subCategoryTitle);
          break;
        }
      case 'Babies & Kids':
        {
          initializeBabiesAndKidsHintTextList(
              babiesAndKidsSubCategoryTitle:subCategoryTitle);
          break;
        }
      case 'Announcements':
        {
          initializeAnnouncementsHintTextList(
              announcementsSubCategoryTitle: subCategoryTitle);
          break;
        }
      default:
        {
          break;
        }
    }
  }

  @override
  void initState() {
    initializeHintTextList(categoryTitle: mainCategoryTitle);
    initializeTextFieldKeyMap();
    initializeTextFieldControllerMap();
    initializeTextFieldVisibilityMap();
    checkVibrationAvailability();
    pickedDate = null;
    pickedTime = null;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    dataCollectionScreenChangeNotifier = Provider.of<DataCollectionScreenChangeNotifier>(context, listen: false);

    dataCollectionScreenChangeNotifier.initializeTextFieldChangeNotifierMap();

    return WillPopScope(
        onWillPop: () {
      categoryTitleForVisibilityController = '';
      isBeingPopped = true;

      for (int i = hintTextList.length - 1; i >= 0; i--) {
        textFieldVisibilityMap[hintTextList[i]] = false;
        dataCollectionScreenChangeNotifier
            .textFieldChangeNotifierMap[hintTextList[i]] = i.toDouble();
      }
      dataCollectionScreenChangeNotifier.notify();
      dataCollectionScreenChangeNotifier.verticalTextVisibility = false;
      Navigator.pop(context);

      pickedDate = null;
      pickedTime = null;
      pickedAnniversary = null;
      babyGender = null;
      age = null;
      textFieldDataMap.clear();
      memorialYearOfBirth = null;
      return Future.value(true);
    },
      child: Scaffold(
      appBar: AppBar(
        title: Text(subCategoryTitle),
        backgroundColor: const Color(0xFF109D92),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: const BoxDecoration(
                color: Color(0xFF109D92),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Please Provide event data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bentham'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  fetchDataCollectionPortion(
                      mainCategoryTitle: mainCategoryTitle,
                      subCategoryTitle: subCategoryTitle),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    decoration: const BoxDecoration(
                        color: Color(0xFF109D92),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextButton(
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white,
                            fontFamily: 'bentham',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () async {
                        textFieldDataMap.clear();
                        for (String hintText in hintTextList) {
                          if (textFieldKeyMap[hintText]!.currentState!.validate()) {
                            textFieldDataMap[hintText] = textFieldControllerMap[hintText]!.text;

                          }
                          else {
                            textFieldDataMap.clear();
                            if (isVibrationAvailable) {
                              Vibration.vibrate();
                            }
                          }
                        }

                        if (textFieldDataMap.length == hintTextList.length) {
                          List<String> _invitationDataList = <String>[];
                          textFieldDataMap.forEach((String key, String value) {
                            _invitationDataList.add(value);
                          });
                          print('............................picked date: $pickedDate');
                          print('............................picked time: $pickedTime');
                          SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
                          await _sharedPreferences.clear();
                          await _sharedPreferences.setStringList('$mainCategoryTitle$subCategoryTitle', _invitationDataList);
                          print("textFieldDataMap: $textFieldDataMap");
                          print(_invitationDataList);
                          Navigator.pushNamed(context, CardCustomizationScreen.ROUTE_NAME, arguments: widget.subCategoryCardData);
                        }

                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
