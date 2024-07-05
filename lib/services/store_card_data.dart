import 'package:flutter/cupertino.dart';

mixin class StoreCardData {

  dynamic storeDataWithCategory({required String title, required dynamic dataList, required int index}){
    switch (title){
      case 'Wedding':
        return WeddingCardDataStore(
          subCategoryImageIndex : dataList[index].id,
          dateTimeLineBreak : dataList[index].dateTimeLineBreak,
          mainAxisAlignment: dataList[index].mainAxisAlignment,
          mainPadding : dataList[index].mainPadding,
          headerTextPartOne : dataList[index].headerTextPartOne,
          partyText : dataList[index].partyText,
          partyTextAlignment : dataList[index].partyTextAlignment,
          partyTextPadding : dataList[index].partyTextPadding,
          withYourFamilyTextFormat: dataList[index].withYourFamilyTextFormat,
          headerTextPartTwo: dataList[index].headerTextPartTwo,
          headerTextPadding: dataList[index].headerTextPadding,
          headerTextAlignment: dataList[index].headerTextAlignment,
          name1TextPadding: dataList[index].name1TextPadding,
          name1TextAlignment: dataList[index].name1TextAlignment,
          dateTimeTextPadding: dataList[index].dateTimeTextPadding,
          dateTimeTextAlignment: dataList[index].dateTimeTextAlignment,
          replyAtText: dataList[index].replyAtText,
          replyAtTextPadding: dataList[index].replyAtTextPadding,
          replyAtTextAlignment: dataList[index].replyAtTextAlignment,
        );
      case 'Birthday':
        return BirthCardDataStore(
            subCategoryImageIndex: dataList[index].subCategoryImageIndex,
            headerTextPartOne: '',
            headerTextPartTwo: '',
            partyText: '',
            afterNameText: '',
            withYourFamilyTextFormat: '',
            mainAxisAlignment: dataList[index].mainAxisAlignment,
            mainPadding: dataList[index].mainPadding
        );
    }
  }


}
class WeddingCardDataStore {
  final int subCategoryImageIndex;
  final int dateTimeLineBreak;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry mainPadding;
  final String headerTextPartOne;
  final String partyText;
  final AlignmentGeometry partyTextAlignment;
  final EdgeInsetsGeometry partyTextPadding;
  final String withYourFamilyTextFormat;
  final String headerTextPartTwo;
  final EdgeInsetsGeometry headerTextPadding;
  final AlignmentGeometry headerTextAlignment;
  final EdgeInsetsGeometry name1TextPadding;
  final AlignmentGeometry name1TextAlignment;
  final EdgeInsetsGeometry dateTimeTextPadding;
  final AlignmentGeometry dateTimeTextAlignment;
  final String replyAtText;
  final EdgeInsetsGeometry replyAtTextPadding;
  final AlignmentGeometry replyAtTextAlignment;

  WeddingCardDataStore({
    required this.subCategoryImageIndex,
    required this.dateTimeLineBreak,
    required this.mainAxisAlignment,
    required this.mainPadding,
    required this.headerTextPartOne,
    required this.partyText,
    required this.partyTextAlignment,
    required this.partyTextPadding,
    required this.withYourFamilyTextFormat,
    required this.headerTextPartTwo,
    required this.headerTextPadding,
    required this.headerTextAlignment,
    required this.name1TextPadding,
    required this.name1TextAlignment,
    required this.dateTimeTextPadding,
    required this.dateTimeTextAlignment,
    required this.replyAtText,
    required this.replyAtTextPadding,
    required this.replyAtTextAlignment,
  });

}

class BirthCardDataStore{
  int subCategoryImageIndex;
  String headerTextPartOne;
  String headerTextPartTwo;
  String partyText;
  String afterNameText;
  String withYourFamilyTextFormat;
  MainAxisAlignment mainAxisAlignment;
  EdgeInsetsGeometry mainPadding;

  BirthCardDataStore({
    required this.subCategoryImageIndex,
    required this.headerTextPartOne,
    required this.headerTextPartTwo,
    required this.partyText,
    required this.afterNameText,
    required this.withYourFamilyTextFormat,
    required this.mainAxisAlignment,
    required this.mainPadding,
  });
}