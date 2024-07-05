import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BirthdayInvitationsCardData {
  final int id;
  final String image;
  final String position;
  final String headerTextPartOne;
  final String headerTextPartTwo;
  final String partyText;
  final String afterNameText;
  final String withYourFamilyTextFormat;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry mainPadding;

  BirthdayInvitationsCardData({
    required this.id,
    required this.image,
    required this.position,
    required this.headerTextPartOne,
    required this.headerTextPartTwo,
    required this.partyText,
    required this.afterNameText,
    required this.withYourFamilyTextFormat,
    required this.mainAxisAlignment,
    required this.mainPadding,
  });

  factory BirthdayInvitationsCardData.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return BirthdayInvitationsCardData(
      id: data['id'],
      image: data['image'],
      position: data['position'],
      headerTextPartOne: data['headerTextPartOne'],
      headerTextPartTwo: data['headerTextPartTwo'],
      partyText: data['partyText'],
      afterNameText: data['afterNameText'],
      withYourFamilyTextFormat: data['withYourFamilyTextFormat'],
      mainAxisAlignment: _mapMainAxisAlignment(data['mainAxisAlignment']),
      mainPadding: EdgeInsets.fromLTRB(
        data['mainPadding']['left'].toDouble(),
        data['mainPadding']['top'].toDouble(),
        data['mainPadding']['right'].toDouble(),
        data['mainPadding']['bottom'].toDouble(),
      ),
    );
  }

  static MainAxisAlignment _mapMainAxisAlignment(int value) {
    switch (value) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start; // Default value or error handling
    }
  }
}

class WeddingInvitationCardData {
  final int id;
  final String image;
  final int dateTimeLineBreak;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry mainPadding;
  final String headerTextPartOne;
  final String partyText;
  final AlignmentGeometry partyTextAlignment;
  final EdgeInsetsGeometry partyTextPadding;
  final String withYourFamilyTextFormat;
  final String headerTextPartTwo;
  final EdgeInsetsGeometry headerTextPadding;
  final AlignmentGeometry headerTextAlignment;
  final EdgeInsetsGeometry name1TextPadding;
  final AlignmentGeometry name1TextAlignment;
  final EdgeInsetsGeometry dateTimeTextPadding;
  final AlignmentGeometry dateTimeTextAlignment;
  final String replyAtText;
  final EdgeInsetsGeometry replyAtTextPadding;
  final AlignmentGeometry replyAtTextAlignment;

  WeddingInvitationCardData({
    required this.id,
    required this.image,
    required this.dateTimeLineBreak,
    required this.mainAxisAlignment,
    required this.mainPadding,
    required this.headerTextPartOne,
    required this.partyText,
    required this.partyTextAlignment,
    required this.partyTextPadding,
    required this.withYourFamilyTextFormat,
    required this.headerTextPartTwo,
    required this.headerTextPadding,
    required this.headerTextAlignment,
    required this.name1TextPadding,
    required this.name1TextAlignment,
    required this.dateTimeTextPadding,
    required this.dateTimeTextAlignment,
    required this.replyAtText,
    required this.replyAtTextPadding,
    required this.replyAtTextAlignment,
  });

  factory WeddingInvitationCardData.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return WeddingInvitationCardData(
      id: data['id'],
      image: data['image'],
      dateTimeLineBreak: data['dateTimeLineBreak'],
      mainAxisAlignment: _mapMainAxisAlignment(data['mainAxisAlignment']),
      mainPadding: _getEdgeInsetsGeometry(data['mainPadding']),
      headerTextPartOne: data['headerTextPartOne'],
      partyText: data['partyText'],
      partyTextAlignment: _getAlignmentGeometry(data['partyTextAlignment']),
      partyTextPadding: _getEdgeInsetsGeometry(data['partyTextPadding']),
      withYourFamilyTextFormat: data['withYourFamilyTextFormat'],
      headerTextPartTwo: data['headerTextPartTwo'],
      headerTextPadding: _getEdgeInsetsGeometry(data['headerTextPadding']),
      headerTextAlignment: _getAlignmentGeometry(data['headerTextAlignment']),
      name1TextPadding: _getEdgeInsetsGeometry(data['name1TextPadding']),
      name1TextAlignment: _getAlignmentGeometry(data['name1TextAlignment']),
      dateTimeTextPadding: _getEdgeInsetsGeometry(data['dateTimeTextPadding']),
      dateTimeTextAlignment: _getAlignmentGeometry(data['dateTimeTextAlignment']),
      replyAtText: data['replyAtText'],
      replyAtTextPadding: _getEdgeInsetsGeometry(data['replyAtTextPadding']),
      replyAtTextAlignment: _getAlignmentGeometry(data['replyAtTextAlignment']),
    );
  }

  static MainAxisAlignment _mapMainAxisAlignment(int value) {
    switch (value) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start; // Default value or error handling
    }
  }

  static EdgeInsetsGeometry _getEdgeInsetsGeometry(Map<String, dynamic>? data) {
    if (data != null) {
      return EdgeInsets.fromLTRB(
        (data['left'] as int? ?? 0).toDouble(),
        (data['top'] as int? ?? 0).toDouble(),
        (data['right'] as int? ?? 0).toDouble(),
        (data['bottom'] as int? ?? 0).toDouble(),
      );
    } else {
      return EdgeInsets.zero;
    }
  }

  static AlignmentGeometry _getAlignmentGeometry(int alignmentType) {
    switch (alignmentType) {
      case 0:
        return Alignment.center;
      case 1:
        return Alignment.centerRight;
      case 2:
        return Alignment.centerLeft;
      case 3:
        return Alignment.topCenter;
      case 4:
        return Alignment.topLeft;
      case 5:
        return Alignment.topRight;
      case 6:
        return Alignment.bottomCenter;
      case 7:
        return Alignment.bottomLeft;
      case 8:
        return Alignment.bottomRight;
    // Add more cases for other alignment types as needed
      default:
        return Alignment.center; // Default to Alignment.center if the alignmentType is unknown
    }
  }
}

