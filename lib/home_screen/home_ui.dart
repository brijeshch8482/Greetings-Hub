import 'package:flutter/material.dart';
import 'greeting_card_ui.dart';
import 'invitations_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String ROUTE_NAME = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Greetings Hub"),
          backgroundColor: const Color(0xFF109D92),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                child: Text(
                  "Invitations",
                  style: TextStyle(fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Greeting Cards",
                  style: TextStyle(fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InvitationsScreen(),
            GreetingCardsScreen()
          ],
        ),
      ),
    );
  }
}

