import 'package:flutter/material.dart';
import 'package:invitation_card_maker/card_make_sreen_upload_your_own/card_design_ui.dart';
import '../card_make_sreen_upload_your_own/card_selection_screen.dart';
import '../constants.dart';
import '../sub_category/sub_category_ui.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String color1;
  final String color2;

  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              colors: [Color(int.parse(color1)), Color(int.parse(color2))],
              // colors: [Colors.redAccent.shade200, Colors.deepOrange.shade800],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -20,
                color: Colors.grey.shade300)
          ]),
      child: InkResponse(
        onTap: () {
          mainCategoryTitle = title;
          if (mainCategoryTitle != "Upload your own"){
            Navigator.pushNamed(context, SubCategorySelection.ROUTE_NAME,
                arguments: title);
          }else{
            Navigator.pushNamed(context, CardDesignScreen.ROUTE_NAME);
          }

        },
        child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: -15,
                left: 30,
                right: 0,
                // Adjust this value to control how much of the image is hidden
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: image != 'assets/images/upload_your_own.png'? Image.network(
                    image, // Replace with your image URL
                    fit: BoxFit.fill,
                  ):const Image(
                      image: AssetImage('assets/images/upload_your_own.png'),
                      fit: BoxFit.fill
                  )
                  ,
                ),
              ),
            ]),
      ),
    );
  }
}
