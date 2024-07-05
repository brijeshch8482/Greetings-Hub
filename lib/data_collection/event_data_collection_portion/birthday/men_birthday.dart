import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../home_screen/home_behavior.dart';
import '../../data_collection_behavior.dart';
import '../data_collection_text_field.dart';

class MenBirthday extends StatefulWidget {
  const MenBirthday({Key? key}) : super(key: key);

  @override
  _MenBirthdayState createState() => _MenBirthdayState();
}

class _MenBirthdayState extends State<MenBirthday> {
  EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 10);

  void showSelectAgeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height:  MediaQuery.of(context).size.height * 0.22,width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height * 0.0332)) , color: Colors.white),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.00667),
                      child: const Text('Select Age', style: TextStyle(fontFamily: 'Roboto',),),
                    ),
                    Divider(color: Colors.black,indent: MediaQuery.of(context).size.height * 0.0084, endIndent: MediaQuery.of(context).size.height * 0.0084,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.arrow_back_ios_sharp, color: Colors.black,size: MediaQuery.of(context).size.width * 0.0334,),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 138,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      age = '${index + 13}';
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
                                                  '${index + 13}',
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Selector<DataCollectionScreenChangeNotifier, double?>(
          shouldRebuild: (previous, next) => previous != next,
          selector: (context, dataCollectionScreenChangeNotifier) =>
          dataCollectionScreenChangeNotifier
              .textFieldChangeNotifierMap[hintTextList[1]],
          builder: (context, value, child) => GestureDetector(
            onTap: () {
              SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(// navigation bar color
                statusBarColor: Colors.transparent, // status bar color
              ));
              showSelectAgeDialog();
            },
            child: DataCollectionTextField(
              margin: margin,
              enable: false,
              hintText: hintTextList[1],
              animation: textFieldShakingAnimationMap[hintTextList[1]],
              width: MediaQuery.of(context).size.width * 0.85,
              textFieldKey: textFieldKeyMap[hintTextList[1]],
              duration: (animationSpeedController * 0.120).toInt(),

              textEditingController: textFieldControllerMap[hintTextList[1]]!
                ..text = age != null
                    ? '$age years old'
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
    );
  }
}
