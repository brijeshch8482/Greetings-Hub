import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../animation_to_video_screen/animation_to_video_behavior.dart';
import '../../../../data_collection/data_collection_behavior.dart';
import '../../../card_customization_behavior.dart';
import '../../../invitation_card_single_text_container.dart';
import '../../../my_animated_text_kit_portion/my_animation_text.dart';
import '../../../my_animated_text_kit_portion/my_colorize_animated_text.dart';
import '../../../my_animated_text_kit_portion/my_fade_animated_text.dart';
import '../../../my_animated_text_kit_portion/my_flicker_animation_text.dart';
import '../../../my_animated_text_kit_portion/my_scale_animated_text.dart';
import '../../../my_animated_text_kit_portion/my_type_writer_animated_text.dart';

class TopLeftToBottomRightWeddingEngagementParty extends StatelessWidget {
  const TopLeftToBottomRightWeddingEngagementParty({Key? key}) : super(key: key);

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
    String formattedAddress = address.replaceFirst(' ', '\n');
    for(int i = 0; i < formattedAddress.length; i++) {
      if(i > lineBreakCounter * 30) {
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
    containerIndexAnimationNumber = [0,1,2,1,2,0];

    formalInvitationHeaderTextPartOne = '\nyou are invited ';
    withYourFamilyTextFormat = 'with your family';
    formalInvitationHeaderTextPartTwo = '\nto the engagement party of';

    initMyAnimatedTextChildObjectMap(context, '$formalInvitationHeaderTextPartOne$formalInvitationHeaderTextPartTwo');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Selector<CardCustomizationScreenChangeNotifier, bool>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[0],
            builder: (context, value, child) {
              if (isInAnimationToVideo) {
                previousAnimationValue = myAnimatedTextKitControllerMap[0]!.value;
              }
              return Visibility(visible: animatedTextContainerVisibilityList[0],maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 16.0), child: invitationCardSingleTextContainer(text: '$formalInvitationHeaderTextPartOne$formalInvitationHeaderTextPartTwo', animationTextNumber: containerIndexAnimationNumber[0], myContainerIndex: 0)));
            }),

        Selector<CardCustomizationScreenChangeNotifier, bool>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[1],
            builder: (context, value, child) {
              if (isInAnimationToVideo) {
                previousAnimationValue = myAnimatedTextKitControllerMap[1]!.value;
              }
              return Visibility(visible: animatedTextContainerVisibilityList[1], maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: Alignment.center, padding: const EdgeInsets.only(right: 72.0), child: invitationCardSingleTextContainer(text: textFieldDataMap[hintTextList[0]]!, animationTextNumber: containerIndexAnimationNumber[1], myContainerIndex: 1)));
            }),

        Selector<CardCustomizationScreenChangeNotifier, bool>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[2],
            builder: (context, value, child) {
              if (isInAnimationToVideo) {
                previousAnimationValue = myAnimatedTextKitControllerMap[2]!.value;
              }
              return Visibility(visible: animatedTextContainerVisibilityList[2], maintainState: true, maintainSize: true, maintainAnimation: true,child: invitationCardSingleTextContainer(text: '&', animationTextNumber: containerIndexAnimationNumber[2], myContainerIndex: 2));
            }),

        Selector<CardCustomizationScreenChangeNotifier, bool>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[3],
            builder: (context, value, child) {
              if (isInAnimationToVideo) {
                previousAnimationValue = myAnimatedTextKitControllerMap[3]!.value;
              }
              return Visibility(visible: animatedTextContainerVisibilityList[3], maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: Alignment.center, padding: const EdgeInsets.only(left: 64.0), child: invitationCardSingleTextContainer(text: textFieldDataMap[hintTextList[1]]!, animationTextNumber: containerIndexAnimationNumber[3], myContainerIndex: 3)));
            }),

        Selector<CardCustomizationScreenChangeNotifier, bool>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[4],
            builder: (context, value, child) {
              if (isInAnimationToVideo) {
                previousAnimationValue = myAnimatedTextKitControllerMap[4]!.value;
              }
              return Visibility(visible: animatedTextContainerVisibilityList[4], maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 40.0), child: invitationCardSingleTextContainer(text: '${DateFormat('EEEE').format(pickedDate!)}, ${pickedDate.getMonthName(monthNumber: pickedDate!.month)} ${appendDateSuffix(date: int.parse(DateFormat('d').format(pickedDate!)))}, ${(DateFormat('yyyy').format(pickedDate!))}\nat ${pickedTime!.format(context).toLowerCase()} in ${reformatAddress(address: textFieldDataMap[hintTextList[2]]!)}', animationTextNumber: containerIndexAnimationNumber[4], myContainerIndex: 4)));
            }),

        Selector<CardCustomizationScreenChangeNotifier, bool>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, cardCustomizationScreenChangeNotifier) => cardCustomizationScreenChangeNotifier.cardCustomizationSelectorControllerList[5],
            builder: (context, value, child) {
              if (isInAnimationToVideo) {
                previousAnimationValue = myAnimatedTextKitControllerMap[5]!.value;
              }
              return Visibility(visible: animatedTextContainerVisibilityList[5], maintainState: true, maintainSize: true, maintainAnimation: true, child: Container(alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 55.0), child: invitationCardSingleTextContainer(text: 'reception to follow at \n ${textFieldDataMap[hintTextList[3]]}', animationTextNumber: containerIndexAnimationNumber[5], myContainerIndex: 5)));
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
    );
  }
}
