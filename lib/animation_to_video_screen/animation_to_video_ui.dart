import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;

import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../card_customization_screen/card_customization_behavior.dart';
import '../data_collection/data_collection_behavior.dart';
import '../home_screen/home_behavior.dart';
import '../network_connectivity_handler.dart';
import 'animation_to_video_behavior.dart';

class AnimationToVideoScreen extends StatefulWidget {
  AnimationToVideoScreen({
    Key? key,
    required this.cardToImage,
  }) : super(key: key);

  CardToImage cardToImage;
  static const String ROUTE_NAME = 'AnimationToVideoScreen';

  @override
  _AnimationToVideoScreenState createState() => _AnimationToVideoScreenState();
}

class _AnimationToVideoScreenState extends State<AnimationToVideoScreen>
    with AnimationToVideoBehavior, ConnectivityHandler {
  bool isExit = false;

  void resetAnimationBehavior() {
    //re initialize with default values

    for (int i = 0; i < myAnimatedTextKitControllerMap.length - 1; i++) {
      if (myAnimatedTextKitControllerMap[i]!.isAnimating) {
        myAnimatedTextKitControllerMap[i]!.reset();
        myAnimatedTextKitControllerMap[i]!.stop();
      }
    }

    isInAnimationToVideo = false;
    namedCounterOfCard = 1;
    isEnable = false;
    isAnimationCompleted = false;

    for (int i = 0; i < animatedTextContainerVisibilityList.length; i++) {
      animatedTextContainerVisibilityList[i] = false;
      cardCustomizationScreenChangeNotifier
              .cardCustomizationSelectorControllerList[i] =
          !(cardCustomizationScreenChangeNotifier
              .cardCustomizationSelectorControllerList[i]);
    }
    cardCustomizationScreenChangeNotifier.myNotify();
  }

  Future<bool> showExitDialog(context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirm Exit?',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        content: const Text(
          'All of your progress will be lost. Are you sure you want to exit?',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                isExit = false;
              },
              child: const Text(
                'No',
                style: TextStyle(fontFamily: 'Roboto'),
              )),
          TextButton(
              onPressed: () async {
                isInAnimationToVideo = false;

                isEnable = false;
                isAnimationCompleted = false;

                for (int i = 0;
                    i < animatedTextContainerVisibilityList.length;
                    i++) {
                  animatedTextContainerVisibilityList[i] = false;
                  cardCustomizationScreenChangeNotifier
                          .cardCustomizationSelectorControllerList[i] =
                      !(cardCustomizationScreenChangeNotifier
                          .cardCustomizationSelectorControllerList[i]);
                }
                cardCustomizationScreenChangeNotifier.myNotify();

                animationProgressStatusChangeNotifier
                    ?.startTextButtonVisibility = true;

                currentVideoTitle = '';
                currentGifTitle = '';
                currentImageTitle = '';
                currentlyProcessingFilePath = '';
                processedVideoCounter = 0;
                namedCounterOfCard = 1;

                isExit = true;
                animationToVideoCurrentStatusList.clear();
                animationToVideoProcessControlList.clear();
                tickMarkList.clear();

                animationController?.reset();
                animationController?.reverse();

                animationController?.reverse();

                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Yes',
                style: TextStyle(fontFamily: 'Roboto'),
              )),
        ],
      ),
    );
    return isExit;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textFieldDataMap.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(await showExitDialog(context));
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 10,
          title: const Text('Download Card',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: MemoryImage(widget.cardToImage.screenShotImage),
                  ),
                ),
              ),
            ),
            myCustomButton("Save To Gallery", Icons.image),
            myCustomButton("Open PDF", Icons.picture_as_pdf_rounded),
            myCustomButton("Share", Icons.share_sharp),
          ],
        ),
      ),
    );
  }

  Widget myCustomButton(String title, IconData buttonIcon) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton.icon(
        icon: Icon(
          buttonIcon,
          color: Colors.white,
        ),
        onPressed: () async {
          if (title == "Save To Gallery") {
            saveImage(widget.cardToImage.screenShotImage);
          } else if (title == "Share") {
            share(widget.cardToImage.screenShotImage);
          } else if (title == "Open PDF") {
            savePdf(widget.cardToImage.screenShotImage);
          }
        },
        label: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 3, 133, 194),
          fixedSize: const Size(208, 43),
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List screenShotImage) async {

    try {

      await [Permission.storage].request();

      final time = DateTime.now()
          .toIso8601String()
          .replaceAll('.', '_')
          .replaceAll(':', '-');
      final name = 'invitationCard_$time';
      final result =
      await ImageGallerySaver.saveImage(screenShotImage, name: name);

      if (kDebugMode) {
        print("this is result : $result");
      } // Check the result in the console
      return result['filePath'];
    } catch (e) {
      if (kDebugMode) {
        print('Error saving image: $e');
      }
      return ''; // Handle the error accordingly
    }
  }

  Future share(Uint8List screenShotImage) async {
    final directory = await getTemporaryDirectory();
    final image = File('${directory.path}/invitationCard.png');
    image.writeAsBytesSync(screenShotImage);

    const text = "This is Invitation Card";
    await Share.shareXFiles([XFile(image.path)], text: text);
  }

  Future<void> savePdf(Uint8List screenShot) async {
    PermissionStatus status = await Permission.notification.status;
    if (!status.isGranted) {
      print('Error saving image: ');
         status = await Permission.notification.request();
    }
    try {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.fill),
            );
          },
        ),
      );

      final output = await getExternalStorageDirectory();
      final pdfFile = File("${output!.path}/Invitation.pdf");
      await pdfFile.writeAsBytes(await pdf.save());

      openFile(pdfFile.path);
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
    }
  }


  void openFile(String filePath) async {
    try {
      await OpenFile.open(filePath);
    } catch (e) {
      print('Error opening file: $e');
    }
  }

}

