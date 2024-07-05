import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../animation_to_video_screen/animation_to_video_behavior.dart';
import '../../../../data_collection/data_collection_behavior.dart';
import '../../../card_customization_behavior.dart';
import '../../../invitation_card_single_text_container.dart';
import '../../../my_animated_text_kit_portion/my_animation_text.dart';
import '../../../my_animated_text_kit_portion/my_colorize_animated_text.dart';
import '../../../my_animated_text_kit_portion/my_fade_animated_text.dart';
import '../../../my_animated_text_kit_portion/my_flicker_animation_text.dart';
import '../../../my_animated_text_kit_portion/my_scale_animated_text.dart';
import 'package:provider/provider.dart';

import '../../../my_animated_text_kit_portion/my_type_writer_animated_text.dart';

class TopLeftToBottomRightWeddingBachelorPartyCardCustomize extends StatelessWidget {

  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry padding;
  final String formalInvitationHeaderTextPartOne;
  final String partyText;
  final String withYourFamilyTextFormat;
  final String formalInvitationHeaderTextPartTwo;
  final EdgeInsetsGeometry formalTextPadding;
  final AlignmentGeometry formalTextAlignment;
  final String nameText;
  final EdgeInsetsGeometry nameTextPadding;
  final AlignmentGeometry nameTextAlignment;
  final String dateTimeText;
  final EdgeInsetsGeometry dateTimeTextPadding;
  final AlignmentGeometry dateTimeTextAlignment;
  final String replyAtText;
  final EdgeInsetsGeometry replyAtTextPadding;
  final AlignmentGeometry replyAtTextAlignment;

  const TopLeftToBottomRightWeddingBachelorPartyCardCustomize({
    Key? key,
    required this.mainAxisAlignment,
    required this.padding,
    required this.formalInvitationHeaderTextPartOne,
    required this.withYourFamilyTextFormat,
    required this.formalInvitationHeaderTextPartTwo,
    required this.formalTextPadding,
    required this.formalTextAlignment,
    required this.nameText,
    required this.nameTextPadding,
    required this.nameTextAlignment,
    required this.dateTimeText,
    required this.dateTimeTextPadding,
    required this.dateTimeTextAlignment,
    required this.replyAtText,
    required this.replyAtTextPadding,
    required this.replyAtTextAlignment,
    required this.partyText}) : super(key: key);

  TextStyle getTextStyle({required int index}) {
    return TextStyle(
        color: Color(cardCustomizationDataModelList[index].textColor),
        fontFamily: cardCustomizationDataModelList[index].fontStyle.replaceAll(' ', ''),
        fontSize: (cardCustomizationDataModelList[index].fontSize).toDouble());
  }

  void initMyAnimatedTextChildObjectMap(BuildContext context, String text) {

    myAnimatedTextChildObjects[0] = MyFadeAnimatedText(text,
        textAlign: cardCustomizationDataModelList[0].textAlignment, textStyle: getTextStyle(index: 0));

    myAnimatedTextChildObjects[1] = MyTypewriterAnimatedText(
      text,
      textAlign: cardCustomizationDataModelList[1].textAlignment,
      textStyle: getTextStyle(index: 1),
    );

    myAnimatedTextChildObjects[2] = MyScaleAnimatedText(text,
      textAlign: cardCustomizationDataModelList[2]
          .textAlignment,
      textStyle: getTextStyle(index: 2),
    );

    myAnimatedTextChildObjects[3] = MyColorizeAnimatedText(text,
      colors: [
        Color(cardCustomizationDataModelList[3].textColor),
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
        Color(cardCustomizationDataModelList[3].textColor),
      ],
      textAlign: cardCustomizationDataModelList[3]
          .textAlignment,
      textStyle: getTextStyle(index: 3),);

    myAnimatedTextChildObjects[4] = MyFlickerAnimatedText(text,
        textAlign: cardCustomizationDataModelList[4]
            .textAlignment,
        textStyle: getTextStyle(index: 4));

  }

  String reformatAddress({required String address}) {
    int lineBreakCounter = 1;
    String formattedAddress = address;
    for(int i = 0; i < formattedAddress.length; i++) {
      if(i > lineBreakCounter * 10) {
        if(formattedAddress[i] == ' ') {
          formattedAddress = formattedAddress.replaceRange(i, i + 1, '\n');
          lineBreakCounter++;
        }
      }
    }
    return formattedAddress;
  }

  @override
  Widget build(BuildContext context) {
    containerIndexAnimationNumber = [0,2,1,2,0];


    initMyAnimatedTextChildObjectMap(context, '$formalInvitationHeaderTextPartOne$formalInvitationHeaderTextPartTwo');

    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [

          Selector<CardCustomizationScreenChangeNotifier, bool>(
              shouldRebuild: (previous, next) => previous != next,
              selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[0],
              builder: (context, value, child) {
                if (isInAnimationToVideo) {
                  previousAnimationValue = myAnimatedTextKitControllerMap[0]!.value;
                }
                return Visibility(visible: animatedTextContainerVisibilityList[0],maintainState: true, maintainSize: true, maintainAnimation: true, child: invitationCardSingleTextContainer(text: '$formalInvitationHeaderTextPartOne$formalInvitationHeaderTextPartTwo', animationTextNumber: containerIndexAnimationNumber[0], myContainerIndex: 0));
              }),

          Selector<CardCustomizationScreenChangeNotifier, bool>(
              shouldRebuild: (previous, next) => previous != next,
              selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[1],
              builder: (context, value, child) {
                if (isInAnimationToVideo) {
                  previousAnimationValue = myAnimatedTextKitControllerMap[1]!.value;
                }
                return Visibility(visible: animatedTextContainerVisibilityList[1], maintainState: true, maintainSize: true, maintainAnimation: true, child: invitationCardSingleTextContainer(text: partyText, animationTextNumber: containerIndexAnimationNumber[1], myContainerIndex: 1));
              }),

          Selector<CardCustomizationScreenChangeNotifier, bool>(
              shouldRebuild: (previous, next) => previous != next,
              selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[2],
              builder: (context, value, child) {
                if (isInAnimationToVideo) {
                  previousAnimationValue = myAnimatedTextKitControllerMap[2]!.value;
                }
                return Visibility(visible: animatedTextContainerVisibilityList[2], maintainState: true, maintainSize: true, maintainAnimation: true,child: Container(alignment: nameTextAlignment, padding: nameTextPadding, child: invitationCardSingleTextContainer(text: nameText, animationTextNumber: containerIndexAnimationNumber[2], myContainerIndex: 2)));
              }),

          Selector<CardCustomizationScreenChangeNotifier, bool>(
              shouldRebuild: (previous, next) => previous != next,
              selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[3],
              builder: (context, value, child) {
                if (isInAnimationToVideo) {
                  previousAnimationValue = myAnimatedTextKitControllerMap[3]!.value;
                }
                return Visibility(visible: animatedTextContainerVisibilityList[3], maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: dateTimeTextAlignment, padding: dateTimeTextPadding, child: invitationCardSingleTextContainer(text: '$dateTimeText\nat ${pickedTime!.format(context).toLowerCase()}\nin ${reformatAddress(address: textFieldDataMap[hintTextList[1]]!)}', animationTextNumber: containerIndexAnimationNumber[3], myContainerIndex: 3)));
              }),

          Selector<CardCustomizationScreenChangeNotifier, bool>(
              shouldRebuild: (previous, next) => previous != next,
              selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[4],
              builder: (context, value, child) {
                if (isInAnimationToVideo) {
                  previousAnimationValue = myAnimatedTextKitControllerMap[4]!.value;
                }
                return Visibility(visible: animatedTextContainerVisibilityList[4], maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: replyAtTextAlignment, padding: replyAtTextPadding, child: invitationCardSingleTextContainer(text: '', animationTextNumber: containerIndexAnimationNumber[4], myContainerIndex: 4)));
              }),
          //to control its its behavior
          MyAnimatedTextKit(
            animationControllerIndex: 6,
            isRepeatingAnimation: false,
            totalRepeatCount: 1,
            repeatForever: false,
            animatedTexts: [
              MyTypewriterAnimatedText('',
                cursor: '',
                textStyle: const TextStyle(fontSize: 0),
              ),
            ],),
        ],
      ),
    );
  }
}
//
