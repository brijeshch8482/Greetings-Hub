import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../card_design_behavior.dart';

class EditTextPage extends StatefulWidget {
  static const String ROUTE_NAME = 'EditTextPage';
  final EditTextPageArguments editTextIndexAndController;
  const EditTextPage({
    Key? key,
    required this.editTextIndexAndController,
  }) : super(key: key);

  @override
  State<EditTextPage> createState() => _EditTextPageState();
}

class _EditTextPageState extends State<EditTextPage> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late int _index;
  bool _isKeyboardVisible = false;
  bool isExit = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.editTextIndexAndController.textEditingController;
    _index = widget.editTextIndexAndController.index;
    _focusNode = FocusNode();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Select all text when the page is loaded
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.value.text.length,
      );
      // Request focus when the page is built
      _focusNode.requestFocus();
      _focusNode.addListener(_handleFocusChange);
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final halfScreenHeight = (screenHeight - appBarHeight - statusBarHeight) / 3;

    return WillPopScope(
      onWillPop: () async {
        if (_isKeyboardVisible) {

          _focusNode.unfocus();
          return false;
        } else {
          return Future.value(await showExitDialog(context));
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CardDesignScreenChangeNotifier>(
                builder: (BuildContext context,
                    cardDesignScreenChangeNotifier, Widget? child) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 15, left: 15, right: 15),
                        alignment: Alignment.topCenter,
                        height: halfScreenHeight,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          textAlign: TextAlign.center,
                          // Align text to center
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter text',
                          ),
                          maxLines: null,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 15, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    letterSpacing: 0.5),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Container(
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.greenAccent.shade700,
                                    Colors.tealAccent.shade700
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Material(
                                elevation: 4,
                                shadowColor:
                                Colors.tealAccent.shade400.withOpacity(0.7),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  onTap: () {
                                    cardDesignScreenChangeNotifier.updateText(_index, _controller);
                                    Navigator.of(context).pop();
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        'Update',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            letterSpacing: 0.5),
                                      ),
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
                },
              ),
            ),
          ),
        ),
      ),
    );
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
}
