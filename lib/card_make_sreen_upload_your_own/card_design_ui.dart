import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'card_design_behavior.dart';
import 'card_all_text_design_screen/edit_text_screen.dart';
import 'color_picker.dart';
import 'icon_single_class.dart';

class CardDesignScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'CardDesignScreen';

  const CardDesignScreen({super.key});

  @override
  State<CardDesignScreen> createState() => _CardDesignScreenState();
}

class _CardDesignScreenState extends State<CardDesignScreen>
    with CardDesignBehavior {

  Widget _bottomSheetFontChild() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 188,
          child: Consumer<CardDesignScreenChangeNotifier>(
            builder: (BuildContext context, cardDesignScreenChangeNotifier, Widget? child) {

              int? activeTextIndex = cardDesignScreenChangeNotifier.activeTextIndex;
              int toUpdateFont = cardDesignScreenChangeNotifier.indexOfFontMap[activeTextIndex ?? 0] ?? 0; // Set default value to 0 if null

              // Scroll the ListView to the position of toUpdateFont
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (designCardFontListScrollController.hasClients) {
                  double scrollOffset = toUpdateFont! * 36.0; // Assuming each item's height is 36
                  designCardFontListScrollController.animateTo(
                    scrollOffset,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              });

              return ListView(
                physics: const BouncingScrollPhysics(),
                controller: designCardFontListScrollController,
                children: [
                  for (int i = 0; i < designCardFontNameList.length; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          toUpdateFont = i;
                        });

                        String fontFamily = designCardFontNameList[i];
                        // Update the value in indexOfFontMap corresponding to the active text index
                        cardDesignScreenChangeNotifier.indexOfFontMap[cardDesignScreenChangeNotifier.activeTextIndex!] = i;
                        cardDesignScreenChangeNotifier.updateFontFamily(cardDesignScreenChangeNotifier.activeTextIndex!, fontFamily, i);

                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        color: toUpdateFont == i
                            ? const Color(0xFFF9F9FB)
                            : Colors.transparent,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                designCardFontNameList[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: designCardFontNameList[i].replaceAll(' ', ''),
                                  color: toUpdateFont == i
                                      ? const Color(0xFF22D28B)
                                      : Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            if (toUpdateFont == i)
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Icon(
                                    Icons.check,
                                    color: Color(0xFF22D28B),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),


                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
  Widget _bottomSheetSizeChild() {
    return AnimatedContainer(
      duration: const Duration(
          milliseconds: 500),
      constraints: const BoxConstraints(
        minHeight: 150,
        maxHeight: double.infinity,
        minWidth: double.infinity,
      ),

      child: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<CardDesignScreenChangeNotifier>(
                builder: (BuildContext context, CardDesignScreenChangeNotifier value, Widget? child) {

                  int? activeTextIndex = cardDesignScreenChangeNotifier.activeTextIndex;
                  double toUpdateFontSize = cardDesignScreenChangeNotifier.mapTextIndexWithFontSize[activeTextIndex ?? 0] ?? 16.0; // Set default value to 16.0 if null

                  return GestureDetector(
                    onTap: () {
                      if (toUpdateFontSize > 7) {
                        cardDesignScreenChangeNotifier.updateFontSize(cardDesignScreenChangeNotifier.bottomSheetSizeSliderValue - 1, cardDesignScreenChangeNotifier.activeTextIndex! );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'A',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            color: Color(0xFF22D28B),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down_sharp, color: Color(0xFF22D28B)),
                      ],
                    ),
                  );
                },),
              AnimatedContainer(
                duration: const Duration(
                    milliseconds: 500),
                width: MediaQuery.of(context).size.width * 0.70,
                child: Consumer<CardDesignScreenChangeNotifier>(
                  builder: (BuildContext context, cardDesignScreenChangeNotifier, Widget? child) {

                    int? activeTextIndex = cardDesignScreenChangeNotifier.activeTextIndex;
                    double toUpdateFontSize = cardDesignScreenChangeNotifier.mapTextIndexWithFontSize[activeTextIndex ?? 0] ?? 16.0; // Set default value to 16.0 if null

                    return SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: const Color(0xFF22D28B),
                          inactiveTrackColor: Colors.green.shade50,
                          valueIndicatorColor: const Color(0xFF22D28B),
                          trackHeight: 3,
                          thumbShape: const RoundSliderThumbShape(
                              elevation: 3,
                              pressedElevation: 10,
                          ),
                          trackShape: const RectangularSliderTrackShape(),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 0.0,
                          ),
                          valueIndicatorTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                          thumbColor: Colors.white,

                      ),
                      child: Slider(
                        onChanged: (newFontSize) {

                          cardDesignScreenChangeNotifier.updateFontSize(newFontSize, cardDesignScreenChangeNotifier.activeTextIndex! );

                        },
                        value: toUpdateFontSize,
                        min: 7,
                        max: 200,
                        divisions: 190,
                        label: '${toUpdateFontSize.toInt()} px',
                      ),
                    );
                  },
                ),
              ),
              Consumer<CardDesignScreenChangeNotifier>(
                builder: (BuildContext context, CardDesignScreenChangeNotifier value, Widget? child) {

                  int? activeTextIndex = cardDesignScreenChangeNotifier.activeTextIndex;
                  double toUpdateFontSize = cardDesignScreenChangeNotifier.mapTextIndexWithFontSize[activeTextIndex ?? 0] ?? 16.0; // Set default value to 16.0 if null

                  return GestureDetector(
                    onTap: () {
                      if (toUpdateFontSize < 200.0) {

                        cardDesignScreenChangeNotifier.updateFontSize(cardDesignScreenChangeNotifier.bottomSheetSizeSliderValue + 1, cardDesignScreenChangeNotifier.activeTextIndex! );

                      }
                    },
                    child: const Row(
                      children: [
                        Text(
                          'A',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              color: Color(0xFF22D28B)),
                        ),
                        Icon(Icons.arrow_drop_up_sharp, color: Color(0xFF22D28B)),
                      ],
                    ),
                  );
                },)
            ],
          ),
        ),
      ),
    );
  }
  Widget _bottomSheetColorChild() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 245,
          width: constraints.maxWidth * 0.67,
          child: Consumer<CardDesignScreenChangeNotifier>(
            builder: (BuildContext context,
                cardDesignScreenChangeNotifier,
                Widget? child) {
              int? activeTextIndex =
                  cardDesignScreenChangeNotifier.activeTextIndex;
              int toUpdateColor =
                  cardDesignScreenChangeNotifier.mapTextIndexWithColor[
                  activeTextIndex ?? 0] ??
                      0; // Set default value to 0 if null

              return Padding(
                padding:
                const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: GridView.count(
                  crossAxisCount: 6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  children: List.generate(allDesignCardColorHexCodeList.length + 1, (index) {
                    if(index == allDesignCardColorHexCodeList.length ){
                      return GestureDetector(
                        onTap: () {
                          ColorPickerDialog.show(context, (int color) {
                            // Handle color change

                            if (!allDesignCardColorHexCodeList.contains(color)) {
                              if(toUpdateColor == cardDesignScreenChangeNotifier.mapTextIndexWithColor[cardDesignScreenChangeNotifier.activeTextIndex!]
                                  && toUpdateColor >= designCardColorHexCodeList.length){

                                // print("same color");
                                // print("designCardColorHexCodeList.length ${designCardColorHexCodeList.length}");
                                // print("toUpdateColor $toUpdateColor");
                                // print("index $index");
                                setState(() {
                                  allDesignCardColorHexCodeList[toUpdateColor] = color;
                                });

                                int textColor = allDesignCardColorHexCodeList[toUpdateColor];// Update the value in indexOfFontMap corresponding to the active text index
                                cardDesignScreenChangeNotifier.mapTextIndexWithColor[cardDesignScreenChangeNotifier.activeTextIndex!] = toUpdateColor;
                                cardDesignScreenChangeNotifier.updateTextAndBorderColor(cardDesignScreenChangeNotifier.activeTextIndex!,textColor,toUpdateColor);

                              }else{
                                setState(() {
                                  // Add the new color to the list
                                  // print('Selected color: $color');
                                  // print("toUpdateColor $toUpdateColor");
                                  // print("designCardColorHexCodeList.length ${designCardColorHexCodeList.length}");
                                  // print("index $index");
                                  allDesignCardColorHexCodeList.add(color);
                                  toUpdateColor = index;
                                });

                                int textColor = allDesignCardColorHexCodeList[index];// Update the value in indexOfFontMap corresponding to the active text index
                                cardDesignScreenChangeNotifier.mapTextIndexWithColor[cardDesignScreenChangeNotifier.activeTextIndex!] = index;
                                cardDesignScreenChangeNotifier.updateTextAndBorderColor(cardDesignScreenChangeNotifier.activeTextIndex!,textColor,index);
                              }



                            }else{
                              toUpdateColor = allDesignCardColorHexCodeList.indexOf(color);
                            }
                          });
                        },
                        child: Transform.scale(
                          scale: 0.8, // Adjust the scale factor as needed
                          child: Image.asset(
                            'assets/icons/color_picker_icon.png',
                          ),
                        ),
                      );
                    }else{
                      int color = allDesignCardColorHexCodeList[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Update the active index
                            toUpdateColor = index;
                          });

                          int textColor =
                          allDesignCardColorHexCodeList[index];
                          // Update the value in indexOfFontMap corresponding to the active text index
                          cardDesignScreenChangeNotifier
                              .mapTextIndexWithColor[
                          cardDesignScreenChangeNotifier
                              .activeTextIndex!] = index;
                          cardDesignScreenChangeNotifier
                              .updateTextAndBorderColor(
                              cardDesignScreenChangeNotifier
                                  .activeTextIndex!,
                              textColor,
                              index);

                        },
                        child: Center(
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color: toUpdateColor == index
                                        ? Color(color)
                                        : Colors.transparent,
                                    width: 1)),
                            child: Center(
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                    color: Color(color),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.black12, width: 0.5)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                  })
                ),
              );
            },
          ),
        );
      },
    );
  }



  @override
  void initState() {

    cardDesignScreenChangeNotifier =
        Provider.of<CardDesignScreenChangeNotifier>(context,
            listen: false);

    allDesignCardColorHexCodeList.addAll(designCardColorHexCodeList); // add existing color to new list

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {

        cardDesignScreenChangeNotifier.editTextWidgets.clear();
        cardDesignScreenChangeNotifier.hideAddItemBottomSheet();
        cardDesignScreenChangeNotifier.hideEditItemBottomSheet();
        cardDesignScreenChangeNotifier.hideFontBottomSheetSheet();
        cardDesignScreenChangeNotifier.hideFontSizeBottomSheetSheet();
        cardDesignScreenChangeNotifier.hideFontColorBottomSheetSheet();

        return Future.value(true);
      },

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          leadingWidth: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF22D28B),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Consumer<CardDesignScreenChangeNotifier>(
          builder: (BuildContext context, cardDesignScreenChangeNotifier,
              Widget? child) {
            final selectedCardSize =
                cardDesignScreenChangeNotifier.selectedCardSize;
            final aspectRatio = selectedCardSize.width / selectedCardSize.height;

            return GestureDetector(
              onTap: () {

                cardDesignScreenChangeNotifier.deactivateAllText();// Deactivate all text widgets
                cardDesignScreenChangeNotifier.hideAddItemBottomSheet(); // addItemBottomSheet visibility hide
                cardDesignScreenChangeNotifier.hideEditItemBottomSheet(); // EditItemBottomSheet visibility hide
                cardDesignScreenChangeNotifier.hideFontBottomSheetSheet(); // FontBottomSheetSheet visibility hide
                cardDesignScreenChangeNotifier.toggleFloatingActionButtonVisibility(); // FloatingActionButton visibility visible
                cardDesignScreenChangeNotifier.hideFontSizeBottomSheetSheet(); // FontSizeBottomSheetSheet visibility hide
                cardDesignScreenChangeNotifier.hideFontColorBottomSheetSheet(); // FontColorBottomSheetSheet visibility hide
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Card(
                      elevation: 0,
                      color: Colors.grey.shade600.withOpacity(0.8),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Stack(
                        children: [
                          ...cardDesignScreenChangeNotifier.editTextWidgets.asMap().entries.map((entry) {
                            final index = entry.key;
                            final widget = entry.value;
                            final rotationAngle = cardDesignScreenChangeNotifier.mapTextIndexWithRotationAngle[index] ?? 0.0; // Get rotation angle from the map

                            return Positioned(
                              left: widget.left,
                              top: widget.top,
                              child: Transform.rotate(
                                alignment: Alignment.center,
                                angle: rotationAngle, // Apply rotation only if selected
                                child: Container(
                                  width: widget.width + 12,
                                  height: widget.height + 50,
                                  color: Colors.transparent,
                                  child: widget,
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
        floatingActionButton: Consumer<CardDesignScreenChangeNotifier>(
          builder: (BuildContext context, cardDesignScreenChangeNotifier,
              Widget? child) {
            return Stack(
              children: [
                Positioned(
                  bottom:
                      cardDesignScreenChangeNotifier.isEditItemBottomSheetVisible
                          ? MediaQuery.of(context).viewInsets.bottom + 80.0
                          : 16.0,
                  right: 10.0,
                  child: Visibility(
                    visible: cardDesignScreenChangeNotifier
                        .isFloatingActionButtonVisible,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (cardDesignScreenChangeNotifier
                            .isEditItemBottomSheetVisible) {
                          cardDesignScreenChangeNotifier
                              .hideEditItemBottomSheet();
                          cardDesignScreenChangeNotifier
                              .toggleAddItemBottomSheetVisibility();
                          cardDesignScreenChangeNotifier
                              .hideFloatingActionButton();
                        } else {
                          cardDesignScreenChangeNotifier
                              .toggleAddItemBottomSheetVisibility();
                          cardDesignScreenChangeNotifier
                              .toggleFloatingActionButtonVisibility();

                        }
                        cardDesignScreenChangeNotifier.deactivateAllText(); //deactivate all text
                      },
                      backgroundColor: const Color(0xFF22D28B),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomSheet: Consumer<CardDesignScreenChangeNotifier>(
          builder: (BuildContext context, cardDesignScreenChangeNotifier,
              Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (cardDesignScreenChangeNotifier.isBottomSheetVisible)
                  _buildAddItemBottomSheet(),
                if (cardDesignScreenChangeNotifier.isEditItemBottomSheetVisible)
                  Material(
                    elevation: 2,
                    shadowColor: Colors.grey,// Set your desired elevation here
                    child: _buildEditItemBottomSheet(),
                  ),
                if (cardDesignScreenChangeNotifier.isFontBottomSheetVisible)
                  _bottomSheetFontChild(),
                if (cardDesignScreenChangeNotifier.isFontSizeBottomSheetVisible)
                  _bottomSheetSizeChild(),
                if (cardDesignScreenChangeNotifier.isFontColorBottomSheetVisible)
                  _bottomSheetColorChild(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddItemBottomSheet() {
    return Consumer<CardDesignScreenChangeNotifier>(
      builder: (BuildContext context, cardDesignScreenChangeNotifier,
          Widget? child) {
        return Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              InkWell(
                onTap: () {

                  cardDesignScreenChangeNotifier
                      .hideAddItemBottomSheet(); // addItemBottomSheet visibility hide
                  cardDesignScreenChangeNotifier
                      .toggleEditItemBottomSheetVisibility(); //EditItemBottomSheetVisibility visible
                  cardDesignScreenChangeNotifier
                      .toggleFloatingActionButtonVisibility(); //floatingActionButton visible
                  cardDesignScreenChangeNotifier.addEditText(); // add text

                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.text_increase_sharp,
                      color: Color(0xFF22D28B),
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Add Text',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'cambria'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Row(
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Color(0xFF22D28B),
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Add Image',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'cambria'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.photo_size_select_actual_sharp,
                    color: Color(0xFF22D28B),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Card Size:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'cambria'),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: cardDesignScreenChangeNotifier.selectedSizeIndex,
                    onChanged: (int? newIndex) {
                      if (newIndex != null) {
                        print("sizeIndex: $newIndex");
                        cardDesignScreenChangeNotifier.changeCardSize(newIndex);
                        cardDesignScreenChangeNotifier.hideAddItemBottomSheet();
                        cardDesignScreenChangeNotifier
                            .toggleFloatingActionButtonVisibility(); //floatingActionButton visible
                      }
                    },
                    items: List.generate(
                      cardDesignScreenChangeNotifier.cardSizeList.length,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Text(
                            '${cardDesignScreenChangeNotifier.cardSizeList[index].width} x ${cardDesignScreenChangeNotifier.cardSizeList[index].height}'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildEditItemBottomSheet() {
    return Consumer<CardDesignScreenChangeNotifier>(
      builder:
          (BuildContext context, cardDesignScreenChangeNotifier, Widget? child) {
        return Container(
          height: 70,
          color: Colors.grey[100],
          padding: const EdgeInsets.only(left: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                InkWell(
                    onTap: (){
                      cardDesignScreenChangeNotifier.deleteActiveText(cardDesignScreenChangeNotifier.activeTextIndex!);
                      cardDesignScreenChangeNotifier.toggleFloatingActionButtonVisibility();
                      cardDesignScreenChangeNotifier.hideEditItemBottomSheet(); // hide the edit item bottom  sheet
                      cardDesignScreenChangeNotifier.hideAllBottomSheet(); // hide all bottom sheet
                    },
                    child: IconWidgetBuilder.buildIcon(CupertinoIcons.delete, 18
                    )
                ),
                const SizedBox(width: 15),
                IconWidgetBuilder.buildVerticalLine(),
                const SizedBox(width: 35),
                InkWell(
                    onTap: (){
                      cardDesignScreenChangeNotifier.hideAllBottomSheet();
                      Navigator.pushNamed(
                          context,
                          EditTextPage.ROUTE_NAME,
                          arguments: EditTextPageArguments(
                              index: cardDesignScreenChangeNotifier.activeTextIndex!,
                              textEditingController: cardDesignScreenChangeNotifier.getControllerFromResizebleWidget(cardDesignScreenChangeNotifier.activeTextIndex!)
                          )
                      );
                    },
                    child: IconWidgetBuilder.buildText('Edit Text')
                ),
                const SizedBox(width: 40),
                InkWell(
                    onTap: (){

                      cardDesignScreenChangeNotifier.toggleFontBottomSheetVisibility();
                      cardDesignScreenChangeNotifier.hideFloatingActionButton(); // floating action button visibility hide
                      cardDesignScreenChangeNotifier.hideFontSizeBottomSheetSheet(); // hide font Size bottom sheet
                      cardDesignScreenChangeNotifier.hideFontColorBottomSheetSheet(); // hide font Color bottom sheet

                    },
                    child: IconWidgetBuilder.buildText('Font')
                ),
                const SizedBox(width: 40),
                InkWell(
                  onTap: (){

                    cardDesignScreenChangeNotifier.toggleFontSizeBottomSheetVisibility();
                    cardDesignScreenChangeNotifier.hideFloatingActionButton(); // floating action button visibility hide
                    cardDesignScreenChangeNotifier.hideFontBottomSheetSheet(); // hide font bottom sheet
                    cardDesignScreenChangeNotifier.hideFontColorBottomSheetSheet(); // hide font Color bottom sheet
                  },
                    child: IconWidgetBuilder.buildText('Size')),
                const SizedBox(width: 40),
                InkWell(
                  onTap: (){

                    cardDesignScreenChangeNotifier.toggleFontColorBottomSheetVisibility();
                    cardDesignScreenChangeNotifier.hideFloatingActionButton(); // floating action button visibility hide
                    cardDesignScreenChangeNotifier.hideFontSizeBottomSheetSheet(); // hide font Size bottom sheet
                    cardDesignScreenChangeNotifier.hideFontBottomSheetSheet(); // hide font bottom sheet
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: cardDesignScreenChangeNotifier.isFontColorBottomSheetVisible
                              ? Color(allDesignCardColorHexCodeList[cardDesignScreenChangeNotifier.mapTextIndexWithColor[cardDesignScreenChangeNotifier.activeTextIndex ?? 0] ?? 0])
                              : Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          CupertinoIcons.circle_fill,
                          color: Color(allDesignCardColorHexCodeList[cardDesignScreenChangeNotifier.mapTextIndexWithColor[cardDesignScreenChangeNotifier.activeTextIndex ?? 0] ?? 0]),
                          size: 25,
                        ),
                      ),
                    )
                ),
                const SizedBox(width: 40),

                InkWell(
                  onTap: (){
                    cardDesignScreenChangeNotifier.updateFontWeight(cardDesignScreenChangeNotifier.activeTextIndex!);
                  },
                    child: Icon(
                        FontAwesome.bold,
                      size: 18,
                      color: cardDesignScreenChangeNotifier.isTextBoldMap[cardDesignScreenChangeNotifier.activeTextIndex ?? 0] == true ? Colors.green : Colors.black,
                    )
                ),

                const SizedBox(width: 40),
                IconWidgetBuilder.buildIcon(FontAwesome.italic, 18),
                const SizedBox(width: 40),
                IconWidgetBuilder.buildIcon(FontAwesome.align_center, 18),
                const SizedBox(width: 40),
                IconWidgetBuilder.buildIcon(FontAwesomeIcons.textHeight, 18),
                const SizedBox(width: 40),
                IconWidgetBuilder.buildSvgIcon(
                    'assets/icons/letter-spacing.svg', 22, 20),
                const SizedBox(width: 40),
                IconWidgetBuilder.buildText('Aa', fontSize: 20),
                const SizedBox(width: 30),
                IconWidgetBuilder.buildSvgIcon(
                    'assets/icons/curved_text.svg', 40, 40),
                const SizedBox(width: 40),
                IconWidgetBuilder.buildVerticalLine(),
                const SizedBox(width: 40),
                IconWidgetBuilder.buildSvgIcon(
                    'assets/icons/copy_text.svg', 22, 22),
                const SizedBox(width: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}






