import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invitation_card_maker/card_make_sreen_upload_your_own/card_all_text_design_screen/selector_widget_draging_circle_ui.dart';
import 'package:provider/provider.dart';
import '../card_design_behavior.dart';
import 'edit_text_screen.dart';


class ResizebleWidget extends StatefulWidget {
  int index;
  bool isDragging = false;
  bool isRotating = false;
  bool isIconTouched = false;
  late bool isActive = true;
  double rotationAngle = 0.0;
  final TextEditingController textEditingController;
  double width;
  double height;
  double top;
  double left;
  double fontSize;
  String fontFamily;
  int textColor;
  bool fontWeight;
  ResizebleWidget({
    Key? key,
    required this.index,
    required this.textEditingController,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
    required this.fontSize,
    required this.fontFamily,
    required this.rotationAngle,
    required this.textColor,
    required this.fontWeight,
  }) : super(key: key);

  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();

}

const ballDiameter = 10.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {

  double minWidth = 80.0;
  double minHeight =20.0;
  bool isSingleLine = true; // Default is single line
  TextOverflow overflow = TextOverflow.clip; // Default value

  double offsetangle = 0.0;
  double previousAngle = 0.0;
  Offset? _startPosition;


  @override
  void initState() {
    if(widget.textEditingController.text.isEmpty){
      widget.textEditingController.text = "Enter text";
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Consumer<CardDesignScreenChangeNotifier>(
      builder: (BuildContext context, cardDesignScreenChangeNotifier, Widget? child) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: 5,
              left: 5,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  cardDesignScreenChangeNotifier.activateText(widget.index);
                  cardDesignScreenChangeNotifier.toggleEditItemBottomSheetVisibility(); // EditItemBottomSheet visibility visible
                  if(cardDesignScreenChangeNotifier.isFontBottomSheetVisible == false){
                    cardDesignScreenChangeNotifier.toggleFloatingActionButtonVisibility(); // EditItemBottomSheet visibility visible
                    cardDesignScreenChangeNotifier.hideAllBottomSheet(); // All secondery bottom sheets visibility hide
                  }

                  if(cardDesignScreenChangeNotifier.isBottomSheetVisible){
                    cardDesignScreenChangeNotifier.hideAddItemBottomSheet(); //if add item bottom sheet visible then hide
                  }

                },
                onDoubleTap: () {
                  Navigator.pushNamed(
                      context,
                      EditTextPage.ROUTE_NAME,
                      arguments: EditTextPageArguments(index: widget.index, textEditingController: widget.textEditingController)
                  );
                },
                onPanStart: (details) {
                  setState(() {
                    widget.isDragging = true; // Set dragging flag to true
                    _startPosition = details.globalPosition;
                  });

                },
                onPanUpdate: widget.isActive
                    ? (details) {
                  setState(() {
                    cardDesignScreenChangeNotifier.hideAllBottomSheet();
                    if (_startPosition != null) {
                      final dx = details.globalPosition.dx - _startPosition!.dx;
                      final dy = details.globalPosition.dy - _startPosition!.dy;
                      widget.left += dx;
                      widget.top += dy;
                      _startPosition = details.globalPosition;
                    }
                  });
                }
                    : null,
                onPanEnd: (_) {
                  setState(() {
                    widget.isDragging = false; // Reset dragging flag to false
                    _startPosition = null;
                  });
                },
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: widget.isActive ? Colors.white24 : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0), // Padding for shifting border inside the container
                    child: Container(

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.isActive ? Color(widget.textColor) : Colors.transparent,
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Center(
                          child: AutoSizeText(
                            widget.textEditingController.text,
                            style: TextStyle(
                              color: Color(widget.textColor),
                              fontSize: widget.fontSize,
                              fontWeight: widget.fontWeight ? FontWeight.bold : FontWeight.normal,
                              // fontStyle: _fontStyle,
                              fontFamily: widget.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.isActive && !widget.isDragging) // Show SelectorWidget only when isActive is true
              Positioned(
                top: 3,
                left: 3,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    cardDesignScreenChangeNotifier.hideAllBottomSheet(); // Hide all bottomSheet
                    var mid = (dx + dy) / 2;
                    var newHeight = cardDesignScreenChangeNotifier.numberOfLines>1
                        ? widget.height - 2 * mid / 2
                        : widget.height - 2 * mid / 5;
                    var newWidth = widget.width - 2 * mid;

                    setState(() {
                      widget.height = newHeight >= minHeight ? newHeight : minHeight;
                      widget.width = newWidth >= minWidth ? newWidth : minWidth;
                      widget.top = widget.top + mid;
                      widget.left = widget.left + mid;
                    });
                    cardDesignScreenChangeNotifier.updateFontSizeByDraging();
                  }, containerColor: widget.textColor,
                ),
              ),
            if (widget.isActive && !widget.isDragging) // Show SelectorWidget only when isActive is true
              Positioned(
                top: 3,
                left: widget.width - 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    cardDesignScreenChangeNotifier.hideAllBottomSheet(); // Hide all bottomSheet
                    var mid = (dx + (dy * -1)) / 2;

                    var newHeight = cardDesignScreenChangeNotifier.numberOfLines>1
                        ? widget.height + 2 * mid / 2
                        : widget.height + 2 * mid / 5;
                    var newWidth = widget.width + 2 * mid;

                    setState(() {
                      widget.height = newHeight >= minHeight ? newHeight : minHeight;
                      widget.width = newWidth >= minWidth ? newWidth : minWidth;
                      widget.top = widget.top - mid;
                      widget.left = widget.left - mid;
                    });
                    cardDesignScreenChangeNotifier.updateFontSizeByDraging();
                  }, containerColor: widget.textColor,
                ),
              ),
            if (widget.isActive && !widget.isDragging) // Show SelectorWidget only when isActive is true
              Positioned(
                top: widget.height - 3,
                left: widget.width - 3,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    cardDesignScreenChangeNotifier.hideAllBottomSheet(); // Hide all bottomSheet
                    var mid = (dx + dy) / 2;

                    var newHeight = cardDesignScreenChangeNotifier.numberOfLines>1
                        ? widget.height + 2 * mid / 2
                        : widget.height + 2 * mid / 5;
                    var newWidth = widget.width + 2 * mid;

                    setState(() {
                      widget.height = newHeight >= minHeight ? newHeight : minHeight;
                      widget.width = newWidth >= minWidth ? newWidth : minWidth;
                      widget.top = widget.top - mid;
                      widget.left = widget.left - mid;
                    });
                    cardDesignScreenChangeNotifier.updateFontSizeByDraging();
                  }, containerColor: widget.textColor,
                ),
              ),
            if (widget.isActive && !widget.isDragging) // Show SelectorWidget only when isActive is true
              Positioned(
                top: widget.height - 2 ,
                left: 3,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    cardDesignScreenChangeNotifier.hideAllBottomSheet(); // Hide all bottomSheet
                    var mid = ((dx * -1) + dy) / 2;

                    var newHeight = cardDesignScreenChangeNotifier.numberOfLines>1
                        ? widget.height + 2 * mid / 2
                        : widget.height + 2 * mid / 5;
                    var newWidth = widget.width + 2 * mid;

                    setState(() {
                      widget.height = newHeight >= minHeight ? newHeight : minHeight;
                      widget.width = newWidth >= minWidth ? newWidth : minWidth;
                      widget.top = widget.top - mid;
                      widget.left = widget.left - mid;
                    });
                    cardDesignScreenChangeNotifier.updateFontSizeByDraging();
                  }, containerColor: widget.textColor,
                ),
              ),
            if(widget.isActive && !widget.isDragging)
              Positioned(
              top: widget.height + 20, // Adjust as needed
              left: widget.width / 2 - 10, // Center horizontally
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (_) {
                  setState(() {
                    widget.isIconTouched = true; // Set icon touched flag to true when icon is touched
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    widget.isIconTouched = false; // Reset icon touched flag to false when touch is released
                  });
                },
                onTapCancel: () {
                  setState(() {
                    widget.isIconTouched = false; // Reset icon touched flag to false when touch is cancelled
                  });
                },

                onPanUpdate: widget.isActive
                    ?(details) {
                  setState(() {
                    widget.isRotating = true; // Reset rotating flag to false when dragging starts
                    double rotationAngle = cardDesignScreenChangeNotifier.rotateAngle + details.delta.dx / 100; // Adjust sensitivity as needed
                    cardDesignScreenChangeNotifier.setRotationAngle(rotationAngle, widget.index);

                    if ((rotationAngle % (pi / 2)).abs() < 0.01 || (rotationAngle % pi).abs() < 0.01) {
                      print("rotation angle : $rotationAngle");
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          HapticFeedback.lightImpact(); // Trigger haptic feedback
                        });
                      });

                    }

                  });
                } : null,
                onPanEnd:(details) {
                  setState(() {
                    widget.isRotating = false;
                  });
                },

                child: Visibility(
                  visible: !widget.isRotating ? true : false,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isIconTouched ? const Color(0xFF22D28B) :Colors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      FontAwesomeIcons.arrowsRotate,
                      size: 15,
                      color: Colors.black54,
                    ), // Example icon, replace with your desired icon
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }


}
