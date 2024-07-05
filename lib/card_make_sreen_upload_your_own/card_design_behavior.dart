
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invitation_card_maker/card_make_sreen_upload_your_own/card_all_text_design_screen/resize_text.dart';

mixin class CardDesignBehavior {
  late CardDesignScreenChangeNotifier cardDesignScreenChangeNotifier;
  final List<Size> cardSizeList = const [
    Size(480, 672), // Rectangle with height longer than width
    Size(1080, 720), // Rectangle with width longer than height
    Size(500, 500), // Square
  ];

  ScrollController designCardFontListScrollController = ScrollController();

  List<String> designCardFontNameList = [
    'Arimo',
    'TeXGyreTermes',
    'Great Vibes',
    'Learning Curve Pro',
    'Open Sans',
    'Open Sans Bold',
    'COM4t',
    'Mountains Of Christmas',
    'Quicksand',
    'Quicksand Bold',
    'Adelicia Script',
    'Parisienne',
    'Patrick Hand',
    'Spicy Rice',
    'Jenna Sue',
    'Josefin Slab',
    'Luckiest Guy',
    'Lato',
    'Cinzel',
    'Amatic SC',
    'Lobster',
    'Merri Weather',
    'Chopin Script',
    'Courgette',
    'Rozha One',
    'Alex Brush',
    'Billabong',
    'Aspire',
    'Angelina',
    'Meddon',
    'Yesteryear',
    'Ardeco',
    'Sail',
    'Vast Shadow',
    'Ribeye Marrow',
    'Let Trace',
    'Intuitive',
    'Kreon',
    'Kreon Bold',
    'Libre',
    'Libre italic',
    'Be Bright',
    'Brayden Script',
    'Blingtastic Script',
    'Bentham',
    'Stint Ultra',
    'Cheque',
    'Engry',
    'Amelia Giovani',
    'Bellasia',
    'Cathiy Betiey',
    'Sleeplesson',
    'Monsieur La Doulaise',
    'Alliana Script',
    'Oswald',
    'Playfair',
    'Shellia',
    'Mottona',
    'Handkerchief',
    'Aerotis',
    'BlackChancery',
    'Cambria',
    'Constantia',
    'FranklinGothicMedium',
    'LittleLordFontleroy',
    'Nature',
    'Parisienne',
    'Majalla',
    'Anydore',
    'Bungasai',
    'Georgia',
    'MfWeddingBells',
    'Acumin',
    'ClubParty',
    'Comic',
    'ArialNarrowRegular',
    'MagnoliaMonogram',
    'FuturaBold',
    'Blacksword',
    'Bahnschrift',
    'AdineKirnberg',
    'AngelTears',
    'Candara',
    'Darleston',
    'LucidaConsole',
    'MVBoli',
    'Sacramento',
    'FuturaLtBT',
  ];
  List<int> designCardColorHexCodeList = [
    0xFF000000,
    0xFFFFFFFF,
    0xFFD6D6D6,
    0xFFF0AD6F,
    0xFF977B58,
    0xFFFFB400,
    0xFF2C91DE,
    0xFF970E65,
    0xFF650633,
    0xFFF3A2A3,
    0xFFD44F70,
    0xFFF35D19,
    0xFF9E5727,
    0xFFD8B571,
    0xFF978454,
    0xFF870D4F,
    0xFF8793D6,
    0xFF866AA5,
    0xFF552978,
    0xFF1D549F,
    0xFF073464,
    0xFF55B2AE,
    0xFF686868,
    0xFFC0CFAF,
    0xFF479446,
    0xFFDB033F,
    0xFFC36241,
    0xFFF58F06,
    0xFFCB41CE,
    0xFF820000,
    0xFFBA0120,
    0xFFC72A71,
    0xFF255701,
  ];
  List<int> allDesignCardColorHexCodeList = [];

}

class CardDesignScreenChangeNotifier with ChangeNotifier, CardDesignBehavior {

// card size
  int _selectedSizeIndex = 0;
  int get selectedSizeIndex => _selectedSizeIndex;
  Size get selectedCardSize => cardSizeList[_selectedSizeIndex];
  void changeCardSize(int newIndex) {
    _selectedSizeIndex = newIndex;
    notifyListeners();
  }

  // text
  final double _minWidth = 80.0;
  final double _minHeight =20.0;
  double _width = 120;
  double _height = 25;
  double top = 180;
  double left = 100;
  double _fontSize = 16.0;
  late String _fontStyle = '';
  int _textColor = 0xFF000000;
  bool _fontWeight = false;
  Map<int, int> indexOfFontMap = {};
  Map<int, int> mapTextIndexWithColor = {};
  Map<int, double> mapTextIndexWithRotationAngle = {};
  Map<int, double> mapTextIndexWithFontSize = {};
  Map<int, bool> isTextBoldMap = {};
  List<ResizebleWidget> editTextWidgets = [];
  List<TextEditingController> controllers = [];
  int? _activeTextIndex;
  int numberOfLines = 0;
  double _rotationAngle = 0.0;
  bool isActive = false;

  void addEditText() {

    for (var widget in editTextWidgets) {// Deactivate all existing text widgets
      widget.isActive = false;
      }
    TextEditingController newController = TextEditingController();

    final resizebleWidget = ResizebleWidget( // Add the new text widget with the new controller
      index: editTextWidgets.length,
      textEditingController: newController,
      width: width,
      height: height,
      top: top + 20,
      left: left + 20,
      fontSize: _fontSize,
      fontFamily: _fontStyle,
      rotationAngle: _rotationAngle,
      textColor: _textColor,
      fontWeight: _fontWeight,
    );
    editTextWidgets.add(resizebleWidget);


    _activeTextIndex = editTextWidgets.length - 1;// Set activeTextIndex to the index of the newly added EditText

    indexOfFontMap[_activeTextIndex!] = 0;// Update the indexOfFontMap with the index of the newly added text widget
    mapTextIndexWithFontSize[_activeTextIndex!] = 16.0;
    mapTextIndexWithRotationAngle[_activeTextIndex!] = 0.0; // map text index with rotation angle
    mapTextIndexWithColor[_activeTextIndex!] = 0; // map text index with color
    isTextBoldMap[_activeTextIndex!] = false; // map text index with color

    notifyListeners();
  }
  void updateText(int index, TextEditingController controller) {
    if (index >= 0 && index < editTextWidgets.length) {
      ResizebleWidget widget = editTextWidgets[index];

      widget.textEditingController.text = controller.text;// Update the text of the ResizebleWidget at the specified index

      numberOfLines = controller.text.split('\n').length; // calculate number of lines to set the height when dragging

      print("Number of lines: $numberOfLines");

      notifyListeners();
        }
  }

  // Inside activateText method
  void activateText(int index) {
    if (editTextWidgets.isNotEmpty) {
      for (int i = 0; i < editTextWidgets.length; i++) {
        (editTextWidgets[i]).isActive = i == index;
      }
      _activeTextIndex = index;
      notifyListeners();
    }
  }
  int? get activeTextIndex => _activeTextIndex;

  // get TextEditingController
  TextEditingController getControllerFromResizebleWidget(int index) {
    if (index >= 0 && index < editTextWidgets.length) {
      ResizebleWidget widget = editTextWidgets[index];
      return widget.textEditingController;
    } else {
      return TextEditingController(); // Return a new TextEditingController if index is out of bounds
    }
  }

  // Deactivate all text widgets
  void deactivateAllText() {
    for (var widget in editTextWidgets) {
      widget.isActive = false;
        }
    _activeTextIndex = null;// Set active text index to null
    notifyListeners();
  }

  // delete activeText
  void deleteActiveText(int index) {
    if (index >= 0 && index < editTextWidgets.length) {

      editTextWidgets.removeAt(index);
      indexOfFontMap.remove(index); // For Font Family data deletion
      mapTextIndexWithFontSize.remove(index); // For Font Size data deletion
      mapTextIndexWithRotationAngle.remove(index); // For Rotation data deletion


      if (_activeTextIndex != null && _activeTextIndex! >= index) {
        _activeTextIndex = _activeTextIndex! - 1;
      }
      for (int i = index; i < editTextWidgets.length; i++) {
        final widget = editTextWidgets[i];
        widget.index = i;
      }
      // fontFamily key remove
      final List<int> keysToUpdate = indexOfFontMap.keys.where((key) => key >= index).toList();
      for (final key in keysToUpdate) {
        indexOfFontMap[key - 1] = indexOfFontMap[key]!;
        indexOfFontMap.remove(key);
      }
      // Font Size key remove
      final List<int> fontSizeKeysToUpdate = mapTextIndexWithFontSize.keys.where((key) => key >= index).toList();
      for (final key in fontSizeKeysToUpdate) {
        mapTextIndexWithFontSize[key - 1] = mapTextIndexWithFontSize[key]!;
        mapTextIndexWithFontSize.remove(key);
      }

      // Rotation key remove
      final List<int> rotationKeysToUpdate = mapTextIndexWithRotationAngle.keys.where((key) => key >= index).toList();
      for (final key in rotationKeysToUpdate) {
        mapTextIndexWithRotationAngle[key - 1] = mapTextIndexWithRotationAngle[key]!;
        mapTextIndexWithRotationAngle.remove(key);
      }

      notifyListeners();
    }
  }

  CardDesignScreenChangeNotifier() {
    _fontStyle = designCardFontNameList.isNotEmpty ? designCardFontNameList[0] : 'Roboto'; // Set _fontStyle to the font at the 0th index if the list is not empty
    _textColor = allDesignCardColorHexCodeList.isNotEmpty ? allDesignCardColorHexCodeList[0] : 0xFF000000; // Set _fontStyle to the font at the 0th index if the list is not empty
  }
  void updateFontFamily(int index, String fontFamily, int indexOfFont) {
    if (index >= 0 && index < editTextWidgets.length) {// Update the font family for the specified text widget
      editTextWidgets[index].fontFamily = fontFamily.replaceAll(' ', '');
      indexOfFontMap[index] = indexOfFont; // Update the value in indexOfFontMap corresponding to the active text index

      notifyListeners();
    }
  }

  // update text and border color
  void updateTextAndBorderColor(int index, int color, int colorIndex){
    if (index >= 0 && index < editTextWidgets.length) {// Update the text color for the specified text widget
      editTextWidgets[index].textColor = color;
      mapTextIndexWithColor[index] = colorIndex; // Update the value in indexOfFontMap corresponding to the active text index

      // for(int i = designCardColorHexCodeList.length; i < allDesignCardColorHexCodeList.length; i++ ){
      //   for (int index in mapTextIndexWithColor.keys) { // Update the value in indexOfFontMap corresponding to the active
      //     // if (mapTextIndexWithColor[index] == colorIndex) {
      //     //   // Color index exists at another index
      //     //   editTextWidgets[index].textColor = color;
      //     // }
      //     if(allDesignCardColorHexCodeList[i] != mapTextIndexWithColor[i]
      //         && mapTextIndexWithColor[index]! >= designCardColorHexCodeList.length){
      //       allDesignCardColorHexCodeList.remove(i);
      //     }
      //   }
      // }
      // print('mapTextIndexWithColor: ${mapTextIndexWithColor.length}');
      // print("allDesignCardColorHexCodeList.length ${allDesignCardColorHexCodeList.length}");
      // print("designCardColorHexCodeList.length ${designCardColorHexCodeList.length}");
      // print("index $index");

      notifyListeners();
    }
  }

  // Update FontWeight of the text
  void updateFontWeight(int index){
    if (index >= 0 && index < editTextWidgets.length){
      editTextWidgets[index].fontWeight = !editTextWidgets[index].fontWeight;
      isTextBoldMap[index] = !isTextBoldMap[index]!;
    }
    notifyListeners();
  }


  // Getter method for width
  double get width => _width;
  // Getter method for height
  double get height => _height;

  // Method to update width
  void setWidth(double width) {
    _width = width;
    notifyListeners();
  }

  // Method to update height
  void setHeight(double height) {
    _height = height;
    notifyListeners();
  }



  // text Rotation angle
  get rotateAngle => _rotationAngle;

  void setRotationAngle(double angle , int index) {
    if (index >= 0 && index < editTextWidgets.length){
      _rotationAngle = angle;
      mapTextIndexWithRotationAngle[index] = angle;
    }

    notifyListeners();
  }

  //font size
  get bottomSheetSizeSliderValue => _fontSize;

  void updateFontSizeByDraging() {
    if (editTextWidgets[activeTextIndex!].width > 0) {
      // Calculate the new font size based on the resized width
      double newFontSize = editTextWidgets[activeTextIndex!].width / 9; // Adjust as needed

      editTextWidgets[activeTextIndex!].fontSize = newFontSize;
      mapTextIndexWithFontSize[activeTextIndex!] = newFontSize;
      // print("New Font size : $newFontSize");
      notifyListeners();
    }
  }

  void updateFontSize(double newFontSize, int textIndex) {
    // Update the font size
    _fontSize = newFontSize;
    mapTextIndexWithFontSize[textIndex] = newFontSize;
    // Get the active text widget
    var activeWidget = editTextWidgets[activeTextIndex!];

    // Calculate the new text width based on the new font size and longest line of text
    String text = activeWidget.textEditingController.text;
    List<String> lines = text.split('\n');
    double maxLineWidth = 0.0;
    lines.forEach((line) {
      double lineWidth = line.length * newFontSize / 2;
      if (lineWidth > maxLineWidth) {
        maxLineWidth = lineWidth;
      }
    });
    double textHeight = lines.length * newFontSize;
    if(lines.length > 1){
      textHeight = lines.length * newFontSize;
    }else{
      textHeight = lines.length * newFontSize * 1.1; // Adjust as needed
    }

    // Ensure minWidth and minHeight constraints are satisfied
    double newWidth = maxLineWidth >= _minWidth ? maxLineWidth : _minWidth;
    double newHeight = textHeight >= _minHeight ? textHeight : _minHeight;

    // Calculate the change in width and height
    double deltaWidth = newWidth - activeWidget.width;
    double deltaHeight = newHeight - activeWidget.height;

    // Update the dimensions of the widget
    activeWidget.width = newWidth;
    activeWidget.height = newHeight;

    // Adjust the position to keep the widget centered
    activeWidget.left -= deltaWidth / 2;
    activeWidget.top -= deltaHeight / 2;

    notifyListeners(); // Notify listeners about the changes
  }

  // bottom sheets
  bool isBottomSheetVisible = false;
  bool isEditItemBottomSheetVisible = false;
  void toggleAddItemBottomSheetVisibility() {
    isBottomSheetVisible = true;
    notifyListeners();
  }
  void toggleEditItemBottomSheetVisibility() {
    isEditItemBottomSheetVisible = true;
    notifyListeners();
  }
  void hideAddItemBottomSheet() {
    isBottomSheetVisible = false;
    notifyListeners();
  }
  void hideEditItemBottomSheet() {
    isEditItemBottomSheetVisible = false;
    notifyListeners();
  }

  bool isFontBottomSheetVisible = false;
  void toggleFontBottomSheetVisibility() {
    isFontBottomSheetVisible = true;
    notifyListeners();
  }
  void hideFontBottomSheetSheet() {
    isFontBottomSheetVisible = false;
    notifyListeners();
  }

  // floatingActionButton
  bool isFloatingActionButtonVisible = true;
  void toggleFloatingActionButtonVisibility() {
    isFloatingActionButtonVisible = true;
    notifyListeners();
  }
  void hideFloatingActionButton() {
    isFloatingActionButtonVisible = false;
    notifyListeners();
  }

  //Bottom sheet font size slider
  bool isFontSizeBottomSheetVisible = false;
  void toggleFontSizeBottomSheetVisibility() {
    isFontSizeBottomSheetVisible = true;
    notifyListeners();
  }
  void hideFontSizeBottomSheetSheet() {
    isFontSizeBottomSheetVisible = false;
    notifyListeners();
  }

  //Bottom sheet font Color slider
  bool isFontColorBottomSheetVisible = false;
  void toggleFontColorBottomSheetVisibility() {
    isFontColorBottomSheetVisible = true;
    notifyListeners();
  }
  void hideFontColorBottomSheetSheet() {
    isFontColorBottomSheetVisible = false;
    notifyListeners();
  }

  void myNotify() {
    notifyListeners();
  }

  void hideAllBottomSheet(){

    hideFontSizeBottomSheetSheet();
    hideFontBottomSheetSheet();
    hideFontColorBottomSheetSheet();
  }

}

class EditTextPageArguments {
  final int index;
  final TextEditingController textEditingController;

  EditTextPageArguments({
    required this.index,
    required this.textEditingController,
  });
}

