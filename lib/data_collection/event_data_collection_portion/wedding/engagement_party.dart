import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home_screen/home_behavior.dart';
import '../../data_collection_behavior.dart';
import '../data_collection_text_field.dart';

class EngagementParty extends StatefulWidget {
  const EngagementParty({Key? key}) : super(key: key);

  @override
  _EngagementPartyState createState() => _EngagementPartyState();
}

class _EngagementPartyState extends State<EngagementParty> {
  EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 10);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Selector<
              DataCollectionScreenChangeNotifier,
              double?>(
            shouldRebuild: (previous, next) =>
            previous != next,
            selector: (context,
                dataCollectionScreenChangeNotifier) =>
            dataCollectionScreenChangeNotifier
                .textFieldChangeNotifierMap[
            hintTextList[0]],
            builder: (context, value, child) =>
                DataCollectionTextField(
                  margin: margin,
                  hintText: hintTextList[0],
                  width: MediaQuery.of(context).size.width * 0.85,
                  textFieldKey: textFieldKeyMap[
                  hintTextList[0]],
                  textEditingController:
                  textFieldControllerMap[
                  hintTextList[0]],
                  animation:
                  textFieldShakingAnimationMap[
                  hintTextList[0]],
                  duration:
                  (animationSpeedController *
                      0.085)
                      .toInt(),

                ),
          ),
          Selector<
              DataCollectionScreenChangeNotifier,
              double?>(
            shouldRebuild: (previous, next) =>
            previous != next,
            selector: (context,
                dataCollectionScreenChangeNotifier) =>
            dataCollectionScreenChangeNotifier
                .textFieldChangeNotifierMap[
            hintTextList[1]],
            builder: (context, value, child) =>
                DataCollectionTextField(
                  margin: margin,
                  hintText: hintTextList[1],
                  width: MediaQuery.of(context).size.width * 0.85,
                  textFieldKey: textFieldKeyMap[
                  hintTextList[1]],
                  textEditingController:
                  textFieldControllerMap[
                  hintTextList[1]],
                  animation:
                  textFieldShakingAnimationMap[
                  hintTextList[1]],
                  duration:
                  (animationSpeedController *
                      0.120)
                      .toInt(),

                ),
          ),
          Selector<
              DataCollectionScreenChangeNotifier,
              double?>(
            shouldRebuild: (previous, next) =>
            previous != next,
            selector: (context,
                dataCollectionScreenChangeNotifier) =>
            dataCollectionScreenChangeNotifier
                .textFieldChangeNotifierMap[
            hintTextList[2]],
            builder: (context, value, child) =>
                DataCollectionTextField(
                  margin: margin,
                  hintText: hintTextList[2],
                  width: MediaQuery.of(context).size.width * 0.85,
                  textFieldKey: textFieldKeyMap[
                  hintTextList[2]],
                  textEditingController:
                  textFieldControllerMap[
                  hintTextList[2]],
                  animation:
                  textFieldShakingAnimationMap[
                  hintTextList[2]],
                  duration:
                  (animationSpeedController *
                      0.155)
                      .toInt(),

                ),
          ),
          Selector<
              DataCollectionScreenChangeNotifier,
              double?>(
            shouldRebuild: (previous, next) =>
            previous != next,
            selector: (context,
                dataCollectionScreenChangeNotifier) =>
            dataCollectionScreenChangeNotifier
                .textFieldChangeNotifierMap[
            hintTextList[3]],
            builder: (context, value, child) =>
                DataCollectionTextField(
                  margin: margin,
                  hintText: hintTextList[3],
                  width: MediaQuery.of(context).size.width * 0.85,
                  textFieldKey: textFieldKeyMap[
                  hintTextList[3]],
                  textEditingController:
                  textFieldControllerMap[
                  hintTextList[3]],
                  animation:
                  textFieldShakingAnimationMap[
                  hintTextList[3]],
                  duration:
                  (animationSpeedController *
                      0.190)
                      .toInt(),

                ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Selector<
                    DataCollectionScreenChangeNotifier,
                    double?>(
                  shouldRebuild:
                      (previous, next) =>
                  previous != next,
                  selector: (context,
                      dataCollectionScreenChangeNotifier) =>
                  dataCollectionScreenChangeNotifier
                      .textFieldChangeNotifierMap[
                  hintTextList[4]],
                  builder:
                      (context, value, child) =>
                      GestureDetector(
                        onTap: () {
                          DataCollectionTextField().selectDate(context: context);
                        },
                        child: DataCollectionTextField(
                          margin: margin,
                          enable: false,
                          hintText: hintTextList[4],
                          animation:
                          textFieldShakingAnimationMap[
                          hintTextList[4]],
                          width:
                          MediaQuery.of(context).size.width * 0.40,
                          textFieldKey:
                          textFieldKeyMap[
                          hintTextList[4]],
                          duration:
                          (animationSpeedController *
                              0.225)
                              .toInt(),

                          textEditingController:
                          textFieldControllerMap[hintTextList[4]]!..text = pickedDate != null ? '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}' : '',
                          textAlign:
                          TextAlign.center,
                          errorBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                20),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                ),
                Selector<
                    DataCollectionScreenChangeNotifier,
                    double?>(
                  shouldRebuild:
                      (previous, next) =>
                  previous != next,
                  selector: (context,
                      dataCollectionScreenChangeNotifier) =>
                  dataCollectionScreenChangeNotifier
                      .textFieldChangeNotifierMap[
                  hintTextList[5]],
                  builder:
                      (context, value, child) =>
                      GestureDetector(
                        onTap: () {
                          DataCollectionTextField().selectTime(context: context);
                        },
                        child: DataCollectionTextField(
                          margin: margin,
                          enable: false,
                          hintText: hintTextList[5],
                          animation:
                          textFieldShakingAnimationMap[
                          hintTextList[5]],
                          width:
                          MediaQuery.of(context).size.width * 0.40,
                          textFieldKey:
                          textFieldKeyMap[
                          hintTextList[5]],

                          duration:
                          (animationSpeedController *
                              0.225)
                              .toInt(),
                          textEditingController:
                          textFieldControllerMap[
                          hintTextList[5]]!
                            ..text = pickedTime !=
                                null
                                ? pickedTime!.format(context).toLowerCase()
                                : '',
                          textAlign:
                          TextAlign.center,
                          errorBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                20),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}