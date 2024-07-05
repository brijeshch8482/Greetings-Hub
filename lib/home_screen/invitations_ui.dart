import 'package:flutter/material.dart';
import 'package:invitation_card_maker/home_screen/singlie_category_card_ui.dart';

import '../model_class/home_page_data.dart';
import '../services/helper.dart';

class InvitationsScreen extends StatefulWidget {
  const InvitationsScreen({super.key});

  @override
  State<InvitationsScreen> createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends State<InvitationsScreen> {

  late Future<List<InvitationsHomeData>> _invitationsHomeData;
  void getData() {
    _invitationsHomeData = Helper().getInvitationsHomeData();
  }

  @override
  void initState(){
    super.initState();

    getData();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 160,
                  child: CategoryCard(
                    image: 'assets/images/upload_your_own.png',
                    title: "Upload your own",
                    color1: '0xFF00B2A9',
                    color2: '0xFF26C6DA',
                  ),
                ),
              ),
            ),
            FutureBuilder<List<InvitationsHomeData>>(
              future: _invitationsHomeData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Text("Error ${snapshot.error}"),
                  );
                } else {
                  final homeDataList = snapshot.data;
                  return SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.999,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final invitationsHomeItem = snapshot.data![index];
                        return CategoryCard(
                          image: invitationsHomeItem.url,
                          title: invitationsHomeItem.name,
                          color1: invitationsHomeItem.color1,
                          color2: invitationsHomeItem.color2,
                        );
                      },
                      childCount: homeDataList!.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }


}
