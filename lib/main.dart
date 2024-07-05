
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invitation_card_maker/data_collection/data_collection_behavior.dart';
import 'package:invitation_card_maker/home_screen/home_behavior.dart';
import 'package:invitation_card_maker/home_screen/home_ui.dart';
import 'package:invitation_card_maker/routes.dart';
import 'package:invitation_card_maker/sub_category/sub_category_selection_behavior.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'animation_to_video_screen/animation_to_video_behavior.dart';
import 'card_customization_screen/card_customization_behavior.dart';
import 'card_make_sreen_upload_your_own/card_design_behavior.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  // Initialize Firebase
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeScreenChangeNotifier>(create: (context) => HomeScreenChangeNotifier()),
      ChangeNotifierProvider<SubCategorySelectionChangeNotifier>(create: (context) => SubCategorySelectionChangeNotifier(),),
      ChangeNotifierProvider<DataCollectionScreenChangeNotifier>(create: (context) => DataCollectionScreenChangeNotifier(),),
      ChangeNotifierProvider<CardCustomizationScreenChangeNotifier>(create: (context) => CardCustomizationScreenChangeNotifier(),),
      ChangeNotifierProvider<CardDesignScreenChangeNotifier>(create: (context) => CardDesignScreenChangeNotifier(),),
      ChangeNotifierProvider<AnimationProgressStatusChangeNotifier>(create: (context) => AnimationProgressStatusChangeNotifier(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlayfairDisplay', colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xfffbfbfb))),
      initialRoute: HomeScreen.ROUTE_NAME,
      onGenerateRoute: generateRoutes,
      home: const HomeScreen(),
      title: 'Greetings Hub',
    ),
  ));
}
