
import 'package:flutter/material.dart';
import 'package:invitation_card_maker/sub_category/sub_category_ui.dart';

import 'animation_to_video_screen/animation_to_video_behavior.dart';
import 'animation_to_video_screen/animation_to_video_ui.dart';
import 'card_customization_screen/card_customization_ui.dart';
import 'card_make_sreen_upload_your_own/card_design_behavior.dart';
import 'card_make_sreen_upload_your_own/card_design_ui.dart';
import 'card_make_sreen_upload_your_own/card_selection_screen.dart';
import 'card_make_sreen_upload_your_own/card_all_text_design_screen/edit_text_screen.dart';
import 'data_collection/data_collection_ui.dart';
import 'gallery_screen/gallery_ui.dart';
import 'home_screen/home_behavior.dart';
import 'home_screen/home_ui.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.ROUTE_NAME:
      {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
            transitionDuration: Duration(milliseconds: (animationSpeedController * 0.15).toInt()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              /*Tween<Offset> homeTransitionTween =
                  Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));*/
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
      }
    case SubCategorySelection.ROUTE_NAME:
      {
        String categoryTitle  = settings.arguments.toString();
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SubCategorySelection(categoryTitleHeroText: categoryTitle,),
            transitionDuration: Duration(milliseconds: (animationSpeedController * 0.25).toInt()),
            reverseTransitionDuration: Duration(milliseconds: (animationSpeedController * 0.25).toInt()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
      }
    case DataCollection.ROUTE_NAME:
      {
        dynamic subCategoryCardData  = settings.arguments;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => DataCollection(subCategoryCardData: subCategoryCardData),
            transitionDuration: Duration(milliseconds: (animationSpeedController * 0.15).toInt()),
            reverseTransitionDuration: Duration(milliseconds: (animationSpeedController * 0.25).toInt()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              /*Tween<Offset> homeTransitionTween =
                  Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));*/
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
      }
    case CardCustomizationScreen.ROUTE_NAME : {
      return MaterialPageRoute(
        builder: (context) => CardCustomizationScreen(subCategoryCardData: settings.arguments),
      );
    }
    case AnimationToVideoScreen.ROUTE_NAME : {

      return MaterialPageRoute(
        builder: (context) => AnimationToVideoScreen(cardToImage: settings.arguments as CardToImage),
      );
    }
    case CardSelectionScreen.ROUTE_NAME : {
      return MaterialPageRoute(
        builder: (context) => CardSelectionScreen(title: settings.arguments),
      );
    }
    case CardDesignScreen.ROUTE_NAME : {
      return MaterialPageRoute(
        builder: (context) => const CardDesignScreen(),
      );
    }
    case EditTextPage.ROUTE_NAME : {
      return MaterialPageRoute(
        builder: (context) => EditTextPage(editTextIndexAndController: settings.arguments as EditTextPageArguments),
      );
    }
    case GalleryScreen.ROUTE_NAME : {
      return MaterialPageRoute(
        builder: (context) => const GalleryScreen(),
      );
    }
    default:
      {
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
      }
  }
}