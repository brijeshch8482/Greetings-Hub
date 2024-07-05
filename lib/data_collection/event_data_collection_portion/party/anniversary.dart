import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../home_screen/home_behavior.dart';
import '../../data_collection_behavior.dart';
import '../data_collection_text_field.dart';

class Anniversary extends StatefulWidget {
  const Anniversary({Key? key}) : super(key: key);

  @override
  _AnniversaryState createState() => _AnniversaryState();
}

class _AnniversaryState extends State<Anniversary> {
  EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 10);
  TextStyle hintStyle = const TextStyle(
      color: Color(0xFF5F5F5F),
      // fontSize: (screenHeight! * 0.0233 <= 16) ? (screenHeight! * 0.0233) : 16
  );
  double height = 60.0;

  void showSelectAnniversaryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height:  MediaQuery.of(context).size.height * 0.25, width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)) , color: Colors.white),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Select Anniversary', style: TextStyle(fontFamily: 'Roboto',),),
                    ),
                    Divider(color: Colors.black,indent: MediaQuery.of(context).size.width * 0.0084, endIndent: MediaQuery.of(context).size.height * 0.85,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.arrow_back_ios_sharp, color: Colors.black,size: MediaQuery.of(context).size.width * 0.0334,),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 150,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    pickedAnniversary = '${index + 1} ${appendAnniversarySuffix(index + 1)}';
                                    Navigator.pop(context);
                                    setState(() {});
                                    dataCollectionScreenChangeNotifier.textFieldChangeNotifierMap[hintTextList[2]] = index.toDouble();
                                  },
                                  child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0292, right: MediaQuery.of(context).size.width * 0.0584,top: MediaQuery.of(context).size.height * 0.00497),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.139,
                                          height: MediaQuery.of(context).size.height * 0.139,
                                          decoration: BoxDecoration(border: Border.all(color:  const Color(0XFFb3868e), width: 1), borderRadius: BorderRadius.circular((MediaQuery.of(context).size.width * 0.139)/2)),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}${appendAnniversarySuffix(index + 1)}',
                                                style: const TextStyle(fontFamily: 'Roboto', color: Colors.black)
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }
                            )),
                        Icon(Icons.arrow_forward_ios_sharp, color: Colors.black,size: MediaQuery.of(context).size.width * 0.0334),
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  String appendAnniversarySuffix(int number) {
    int digit;
    if (number >= 0 && number <= 9) {
      digit = number;
      switch (digit) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    } else if (number >= 10 && number <= 20) {
      return 'th';
    } else if (number >= 21 && number <= 99) {
      digit = number % 10;
      switch (digit) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    } else if (number >= 100 && number <= 999) {
      digit = number % 100;
      return appendAnniversarySuffix(digit);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Selector<DataCollectionScreenChangeNotifier, double?>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, dataCollectionScreenChangeNotifier) =>
                dataCollectionScreenChangeNotifier
                    .textFieldChangeNotifierMap[hintTextList[0]],
            builder: (context, value, child) => DataCollectionTextField(
              margin: margin,
              hintText: hintTextList[0],
              width: MediaQuery.of(context).size.width * 0.85,
              height: height,
              textFieldKey: textFieldKeyMap[hintTextList[0]],
              textEditingController: textFieldControllerMap[hintTextList[0]],
              animation: textFieldShakingAnimationMap[hintTextList[0]],
              hintStyle: hintStyle,
              duration: (animationSpeedController * 0.085).toInt(),
            ),
          ),
          Selector<DataCollectionScreenChangeNotifier, double?>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, dataCollectionScreenChangeNotifier) =>
                dataCollectionScreenChangeNotifier
                    .textFieldChangeNotifierMap[hintTextList[1]],
            builder: (context, value, child) => DataCollectionTextField(
              margin: margin,
              hintStyle: hintStyle,
              hintText: hintTextList[1],
              width: MediaQuery.of(context).size.width * 0.85,
              height: height,
              textFieldKey: textFieldKeyMap[hintTextList[1]],
              textEditingController: textFieldControllerMap[hintTextList[1]],
              animation: textFieldShakingAnimationMap[hintTextList[1]],
              duration: (animationSpeedController * 0.120).toInt(),

            ),
          ),
          Selector<DataCollectionScreenChangeNotifier, double?>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, dataCollectionScreenChangeNotifier) =>
                dataCollectionScreenChangeNotifier
                    .textFieldChangeNotifierMap[hintTextList[2]],
            builder: (context, value, child) => GestureDetector(
              onTap: () {
                SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(// navigation bar color
                  statusBarColor: Colors.transparent, // status bar color
                ));
                showSelectAnniversaryDialog();
              },
              child: DataCollectionTextField(
                margin: margin,
                hintStyle: hintStyle,
                enable: false,
                hintText: hintTextList[2],
                animation: textFieldShakingAnimationMap[hintTextList[2]],
                width: MediaQuery.of(context).size.width * 0.85,
                height: height,
                textFieldKey: textFieldKeyMap[hintTextList[2]],
                duration: (animationSpeedController * 0.155).toInt(),

                textEditingController: textFieldControllerMap[hintTextList[2]]!
                  ..text = pickedAnniversary != null
                      ? '$pickedAnniversary Anniversary'
                      : '',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Selector<DataCollectionScreenChangeNotifier, double?>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, dataCollectionScreenChangeNotifier) =>
                dataCollectionScreenChangeNotifier
                    .textFieldChangeNotifierMap[hintTextList[3]],
            builder: (context, value, child) => DataCollectionTextField(
              margin: margin,
              hintStyle: hintStyle,
              hintText: hintTextList[3],
              width: MediaQuery.of(context).size.width * 0.85,
              height: height,
              textFieldKey: textFieldKeyMap[hintTextList[3]],
              textEditingController: textFieldControllerMap[hintTextList[3]],
              animation: textFieldShakingAnimationMap[hintTextList[3]],
              duration: (animationSpeedController * 0.190).toInt(),

            ),
          ),
          Selector<DataCollectionScreenChangeNotifier, double?>(
            shouldRebuild: (previous, next) => previous != next,
            selector: (context, dataCollectionScreenChangeNotifier) =>
                dataCollectionScreenChangeNotifier
                    .textFieldChangeNotifierMap[hintTextList[4]],
            builder: (context, value, child) => DataCollectionTextField(
              margin: margin,
              hintStyle: hintStyle,
              hintText: hintTextList[4],
              width: MediaQuery.of(context).size.width * 0.85,
              height: height,
              textFieldKey: textFieldKeyMap[hintTextList[4]],
              textEditingController: textFieldControllerMap[hintTextList[4]],
              animation: textFieldShakingAnimationMap[hintTextList[4]],
              duration: (animationSpeedController * 0.225).toInt(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Selector<DataCollectionScreenChangeNotifier, double?>(
                  shouldRebuild: (previous, next) => previous != next,
                  selector: (context, dataCollectionScreenChangeNotifier) =>
                      dataCollectionScreenChangeNotifier
                          .textFieldChangeNotifierMap[hintTextList[5]],
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      DataCollectionTextField().selectDate(context: context);
                    },
                    child: DataCollectionTextField(
                      margin: margin,
                      hintStyle: hintStyle,
                      enable: false,
                      hintText: hintTextList[5],
                      animation: textFieldShakingAnimationMap[hintTextList[5]],
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: height,
                      textFieldKey: textFieldKeyMap[hintTextList[5]],
                      duration: (animationSpeedController * 0.260).toInt(),

                      textEditingController: textFieldControllerMap[
                          hintTextList[5]]!
                        ..text = pickedDate != null
                            ? '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}'
                            : '',
                      textAlign: TextAlign.center,
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Selector<DataCollectionScreenChangeNotifier, double?>(
                  shouldRebuild: (previous, next) => previous != next,
                  selector: (context, dataCollectionScreenChangeNotifier) =>
                      dataCollectionScreenChangeNotifier
                          .textFieldChangeNotifierMap[hintTextList[6]],
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      DataCollectionTextField().selectTime(context: context);
                    },
                    child: DataCollectionTextField(
                      margin: margin,
                      hintStyle: hintStyle,
                      enable: false,
                      hintText: hintTextList[6],
                      animation: textFieldShakingAnimationMap[hintTextList[6]],
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: height,
                      textFieldKey: textFieldKeyMap[hintTextList[6]],

                      duration: (animationSpeedController * 0.260).toInt(),
                      textEditingController:
                          textFieldControllerMap[hintTextList[6]]!
                            ..text = pickedTime != null
                                ? pickedTime!.format(context).toLowerCase()
                                : '',
                      textAlign: TextAlign.center,
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20),
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
