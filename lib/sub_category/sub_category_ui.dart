import 'package:flutter/material.dart';
import 'package:invitation_card_maker/constants.dart';
import 'package:invitation_card_maker/sub_category/sub_category_selection_behavior.dart';
import 'package:provider/provider.dart';

import '../data_collection/data_collection_ui.dart';
import '../model_class/invitations_card_data.dart';
import '../services/store_card_data.dart';


class SubCategorySelection extends StatefulWidget {
  const SubCategorySelection({super.key, this.categoryTitleHeroText});

  static const String ROUTE_NAME = 'SubCategorySelection';
  final categoryTitleHeroText;

  @override
  State<SubCategorySelection> createState() => _SubCategorySelectionState();
}

class _SubCategorySelectionState extends State<SubCategorySelection> with SubCategoryImage, StoreCardData {

  var imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategorySelectionChangeNotifier>(
      builder: (BuildContext context, subCategorySelectionChangeNotifier,
          Widget? child) {
        // This is for the category selection name
        subCategorySelectionChangeNotifier
            .initializeSubCategorySelectionButtonTextList(
            listTitle: widget.categoryTitleHeroText);
        List<String> subCategoryName = subCategorySelectionChangeNotifier
            .subCategorySelectionButtonTextList;
        List<String> subCategoryImages = subCategorySelectionChangeNotifier
            .gridViewCardsImagePathList;

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.categoryTitleHeroText),
            backgroundColor: const Color(0xFF109D92),
          ),
          body: Column(
            children: [

              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10),
                height: 40,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subCategoryName.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            imageIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.teal.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(child: Text(subCategoryName[index])),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: FutureBuilder<List<dynamic>>(
                      future: getSubCategoryImage(
                          completeCategory: '${mainCategoryTitle}_${subCategoryName[imageIndex]}', title: mainCategoryTitle),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot
                              .error}'));
                        }

                        List<dynamic> dataList = snapshot.data ?? [];

                        if (dataList.isEmpty) {
                          return const Image(
                              image: AssetImage('assets/images/no_data_found/no_data_found.png'));
                        }

                        return GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 5 / 7,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          children: List.generate(
                              dataList.length,
                                  (index) =>
                                  GestureDetector(
                                    onTap: () {
                                      mainCategoryTitle =
                                          widget.categoryTitleHeroText;
                                      subCategoryTitle =
                                      subCategoryName[imageIndex];
                                      completeCategoryName = '${mainCategoryTitle}_${subCategoryName[imageIndex]}';
                                      // textPosition = dataList[index].position;
                                      cardId = dataList[index].id;

                                      final dynamic storeCardData = storeDataWithCategory(title: mainCategoryTitle, dataList: dataList, index: index,);
                                      print("storeCardData: ${storeCardData.toString()}");
                                      print("index: $index");
                                      Navigator.pushNamed(
                                          context, DataCollection.ROUTE_NAME,
                                          arguments: storeCardData);
                                    },
                                    child: Card(
                                      elevation: 3,
                                      child: dataList[0].image != 'assets/images/no_data_found/no_data_found.png'
                                          ?Image(
                                        image: NetworkImage(
                                          dataList[index].image,
                                        ),
                                        fit: BoxFit.contain,
                                      )
                                          :const Image(
                                          image: AssetImage('assets/images/no_data_found/no_data_found.png')),
                                    ),
                                  )),
                        );
                      }
                  )

              ),
            ],
          ),
        );
      },
    );
  }
}
